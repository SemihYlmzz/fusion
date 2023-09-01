const functions = require("firebase-functions");
const admin = require("firebase-admin");
admin.initializeApp();

const deckOptions = [
  "emberus",
  "ignis",
  "blazeon",
  "flamara",
  "pyyrhus",
  "embrella",
  "solara",
  "flamorion",
  "solarius",
  "dramber",
  "triton",
  "oceanus",
  "river",
  "nereus",
  "dylan",
  "kai",
  "marina",
  "neptune",
  "caroline",
  "aquarius",
  "terra",
  "gaia",
  "lyra",
  "flint",
  "boulder",
  "arvid",
  "gideon",
  "onyx",
  "ragnar",
  "thorin",
  "aero",
  "nova",
  "aurora",
  "seraphina",
  "celeste",
  "luna",
  "ember",
  "aria",
  "zephyr",
  "orion",
];

/**
 * Creates a user document in Firestore when a new user is created.
 *
 * @param {object} array - The array which contains all strings to pick random.
 * @param {object} count - The int which hold how many random element you want.
 * @return {Promise} A promise that resolves when the user document is created.
 */
function getRandomUniqueItemsFromArray(array, count) {
  const shuffled = array.slice();
  let i = array.length;
  let temp;
  let index;

  while (i--) {
    index = Math.floor((i + 1) * Math.random());
    temp = shuffled[index];
    shuffled[index] = shuffled[i];
    shuffled[i] = temp;
  }

  return shuffled.slice(0, count);
}

exports.createUserDocument = functions.auth.user().onCreate((user) => {
  let isGuest = true;
  for (const provider of user.providerData) {
    if (provider.providerId !== "firebase") {
      isGuest = false;
      break;
    }
  }

  const deck = getRandomUniqueItemsFromArray(deckOptions, 8);

  return admin.firestore().collection("users").doc(user.uid).set({
    "accountDeletionScheduledDate": null,
    "dateOfCreate": Date.now(),
    "email": user.email,
    "uid": user.uid,
    "username": "",
    "accountnameChangeEligibilityDate": Date.now(),
    "lastActivityDate": Date.now(),
    "isGuest": isGuest,
    "gameId": null,
    "deck": deck,
  });
});

exports.changeUsername = functions.https.onRequest(async (req, res) => {
  const idToken = req.header("Authorization").split("Bearer ")[1];
  try {
    const currentDate = new Date();
    const oneMonthFromNow = new Date(
        currentDate.getFullYear(),
        currentDate.getMonth() + 1, currentDate.getDate(),
        currentDate.getHours(),
    );
    const millisecondsSinceEpoch = oneMonthFromNow.getTime();
    const currentMilliseconds = new Date().getTime();

    const newUsername = req.body.newUsername;
    const decodedToken = await admin.auth().verifyIdToken(idToken);
    const userId = decodedToken.uid;

    const usernameExists = await admin.firestore().collection("users")
        .where("username", "==", newUsername)
        .get();
    const currentUserData = await admin.firestore().collection("users")
        .doc(userId)
        .get();
    if (newUsername.length < 3) {
      return res.status(400).send("Username too short.");
    }
    if (newUsername.length > 20) {
      return res.status(400).send("Username too long.");
    }
    if (!/^[a-zA-Z0-9]+$/.test(newUsername)) {
      return res.status(400).send("Username has special characters.");
    }

    if (!usernameExists.empty) {
      return res.status(400).send("Username not unique.");
    }
    if (userId == null) {
      return res.status(400).send("No user detected.");
    }
    const accountnameChangeEligibilityDate = currentUserData
        .data()
        .accountnameChangeEligibilityDate;
    if (accountnameChangeEligibilityDate &&
        accountnameChangeEligibilityDate > currentMilliseconds) {
      return res.status(400).send("Too early to change username.");
    }
    const userRef = admin.firestore().collection("users").doc(userId);

    await userRef.update({
      username: newUsername,
      accountnameChangeEligibilityDate: millisecondsSinceEpoch,
    });

    return res.status(200).send("Username succesfuly changed.");
  } catch (error) {
    console.error("Error:", error);
    return res.status(500).send("Error while updating username.");
  }
});

exports.createDeleteRequest = functions.https.onRequest(async (req, res) => {
  const idToken = req.header("Authorization").split("Bearer ")[1];
  try {
    const currentDate = new Date();
    const oneMonthFromNow = new Date(
        currentDate.getFullYear(),
        currentDate.getMonth() + 1, currentDate.getDate(),
    );
    const millisecondsSinceEpoch = oneMonthFromNow.getTime();

    const decodedToken = await admin.auth().verifyIdToken(idToken);
    const userId = decodedToken.uid;
    if (userId == null) {
      return res.status(400).send("No user detected.");
    }
    const deleteRequestExists = await admin.firestore()
        .collection("delete_requests")
        .where("uid", "==", userId)
        .get();

    if (!deleteRequestExists.empty) {
      return res.status(400).send("Account already in delete progress.");
    }

    const deleteRequestRef = admin.firestore()
        .collection("delete_requests").doc(userId);

    await deleteRequestRef.create({
      uid: userId,
      scheduledDeleteDate: millisecondsSinceEpoch,
    });

    return res.status(200).send("Deletion Request Succesfully created.");
  } catch (error) {
    console.error("Error:", error);
    return res.status(500).send("Error while creating Delete Request.");
  }
});

exports.cancelDeleteRequest = functions.https.onRequest(async (req, res) => {
  const idToken = req.header("Authorization").split("Bearer ")[1];
  try {
    const decodedToken = await admin.auth().verifyIdToken(idToken);
    const userId = decodedToken.uid;
    if (userId == null) {
      return res.status(400).send("No user detected.");
    }
    const deleteRequestSnapshot = await admin.firestore()
        .collection("delete_requests")
        .doc(userId)
        .get();

    if (!deleteRequestSnapshot.exists) {
      return res.status(400).send("No delete request found for this user.");
    }

    // Delete the delete request document
    await deleteRequestSnapshot.ref.delete();

    return res.status(200).send("Delete Request Succesfully canceled.");
  } catch (error) {
    console.error("Error:", error);
    return res.status(500).send("Error while Canceling Delete Request.");
  }
});

exports.deleteOldDeleteRequestedUserDatas = functions.pubsub
    .schedule("0 5 * * *")
    .timeZone("UTC")
    .onRun(async (context) => {
      const nowMillis = Date.now();
      const deleteRequestsRef = admin.firestore()
          .collection("delete_requests");

      const querySnapshot = await deleteRequestsRef
          .where("scheduledDeleteDate", "<=", nowMillis)
          .get();

      const batch = admin.firestore().batch();
      const deletedUserUIDs = [];

      querySnapshot.forEach((doc) => {
        const uid = doc.data().uid;

        deletedUserUIDs.push(uid);
        const userDocRef = admin.firestore().collection("users").doc(uid);
        batch.delete(userDocRef);
        batch.delete(doc.ref);
      });

      for (const uidToDelete of deletedUserUIDs) {
        try {
          await admin.auth().deleteUser(uidToDelete);
          console.log(`Firebase Auth User deleted for UID: ${uidToDelete}`);
        } catch (error) {
          console.error(
              `Error deleting Firebase Auth User for UID: ${uidToDelete}`,
              error,
          );
        }
      }
      await batch.commit();

      console.log("Old Delete Requested Users Deleted!");
      return null;
    });

exports.refreshMyDeck = functions.https.onRequest(async (req, res) => {
  try {
    const deck = getRandomUniqueItemsFromArray(deckOptions, 8);
    const idToken = req.header("Authorization").split("Bearer ")[1];
    const decodedToken = await admin.auth().verifyIdToken(idToken);
    const userId = decodedToken.uid;
    const userRef = admin.firestore().collection("users").doc(userId);
    await userRef.update({
      deck: deck,
    });
    res.status(200).send("Deck refreshed successfully");
  } catch (error) {
    console.error("Error:", error);
    res.status(500).send("An error occurred while refreshing the deck.");
  }
});

exports.leaveQueue = functions.https.onRequest(async (req, res) => {
  const idToken = req.header("Authorization").split("Bearer ")[1];
  try {
    const decodedToken = await admin.auth().verifyIdToken(idToken);
    const userId = decodedToken.uid;
    if (userId == null) {
      return res.status(400).send("No user detected.");
    }
    const queueExists = await admin.firestore()
        .collection("queue")
        .where("uid", "==", userId)
        .get();

    if (queueExists.empty) {
      return res.status(400).send("Not in queue.");
    }

    const queueRequestRef = admin.firestore()
        .collection("queue").doc(userId);

    await queueRequestRef.delete();

    return res.status(200).send("Succesfully leaved queue.");
  } catch (error) {
    console.error("Error:", error);
    return res.status(500).send("Error while Leaving Queue.");
  }
});

exports.enterQueue = functions.https.onRequest(async (req, res) => {
  const idToken = req.header("Authorization").split("Bearer ")[1];
  try {
    const currentDate = new Date();
    const millisecondsSinceEpoch = currentDate.getTime();

    const decodedToken = await admin.auth().verifyIdToken(idToken);
    const userId = decodedToken.uid;
    if (userId == null) {
      return res.status(400).send("No user detected.");
    }
    const queueExists = await admin.firestore()
        .collection("queue")
        .where("uid", "==", userId)
        .get();

    if (!queueExists.empty) {
      return res.status(400).send("Already in Queue.");
    }

    const queueRequestRef = admin.firestore()
        .collection("queue").doc(userId);

    await queueRequestRef.create({
      uid: userId,
      dateOfCreate: millisecondsSinceEpoch,
    });

    return res.status(200).send("Succesfully entered queue.");
  } catch (error) {
    console.error("Error:", error);
    return res.status(500).send("Error while Entering Queue.");
  }
});

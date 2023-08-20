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
  try {
    const newUsername = req.body.newUsername;
    const usernameExists = await admin.firestore().collection("users")
        .where("username", "==", newUsername)
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
    const userId = req.body.userId;
    const userRef = admin.firestore().collection("users").doc(userId);

    await userRef.update({
      username: newUsername,
    });

    return res.status(200).send("Username succesfuly changed.");
  } catch (error) {
    console.error("Error:", error);
    return res.status(500).send("Error while updating username.");
  }
});

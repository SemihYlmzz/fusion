import * as admin from "firebase-admin";
import * as express from "express";


export const changeUsernameFunction: (
  req: express.Request,
  res: express.Response
) => void | Promise<void> = async (req, res) => {
  try {
    const authorizationHeader = req.header("Authorization");
    let idToken: string | undefined;

    if (authorizationHeader) {
      idToken = authorizationHeader.split("Bearer ")[1];
    } else {
      res.status(401).send("Authorization header is missing.");
      return;
    }
    const decodedToken = await admin.auth().verifyIdToken(idToken);
    const userId = decodedToken.uid;
    if (userId == null || userId === undefined) {
      res.status(400).send("No user detected.");
      return;
    }

    const newUsername = req.body.newUsername;
    if (newUsername.length < 3) {
      res.status(400).send("Username too short.");
      return;
    }
    if (newUsername.length > 20) {
      res.status(400).send("Username too long.");
      return;
    }
    if (!/^[a-zA-Z0-9]+$/.test(newUsername)) {
      res.status(400).send("Username has special characters.");
      return;
    }

    const usernameExists = await admin.firestore().collection("users")
      .where("username", "==", newUsername)
      .get();
    if (!usernameExists.empty) {
      res.status(400).send("Username not unique.");
      return;
    }


    const currentDate = new Date();
    const oneMonthFromNow = new Date(
      currentDate.getFullYear(),
      currentDate.getMonth() + 1,
      currentDate.getDate(),
      currentDate.getHours(),
    );
    const oneMonthMillis = oneMonthFromNow.getTime();
    const nowMillis = currentDate.getTime();


    const currentUserDocument: admin.firestore.DocumentSnapshot<admin
    .firestore.DocumentData> = await admin.firestore().collection("users")
      .doc(userId)
      .get();
    const currentUserData = currentUserDocument.data();
    if (currentUserData == null) {
      res.status(400).send("No user detected.");
      return;
    }


    const accountnameChangeEligibilityDate = currentUserData
      .accountnameChangeEligibilityDate;
    if (accountnameChangeEligibilityDate &&
        accountnameChangeEligibilityDate > nowMillis) {
      res.status(400).send("Too early to change username.");
      return;
    }
    const userRef = admin.firestore().collection("users").doc(userId);

    await userRef.update({
      username: newUsername,
      accountnameChangeEligibilityDate: oneMonthMillis,
    });

    res.status(200).send("Username succesfuly changed.");
    return;
  } catch (error) {
    console.error("Error:", error);
    res.status(500).send("Error while updating username.");
    return;
  }
};



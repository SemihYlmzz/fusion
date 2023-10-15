import * as admin from "firebase-admin";
import * as express from "express";


export const enterNormalQueueFunction: (
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
    const currentDate = new Date();
    const millisecondsSinceEpoch = currentDate.getTime();

    const currentUserDocument: admin.firestore.DocumentSnapshot<admin
    .firestore.DocumentData> = await admin.firestore().collection("users")
      .doc(userId)
      .get();
    const currentUserData = currentUserDocument.data();
    if (currentUserData == null) {
      res.status(400).send("No user detected.");
      return;
    }

    const username = currentUserData.username;
    const leaguePoint = currentUserData.leaguePoint;

    // Kullanıcının zaten sıraya girmiş olup olmadığını kontrol et
    const queueExists = await admin.firestore()
      .collection("queue")
      .where("uid", "==", userId)
      .get();

    if (!queueExists.empty) {
      res.status(400).send("Already in Queue.");
      return;
    }

    const queueRequestRef = admin.firestore()
      .collection("queue").doc(userId);

    await queueRequestRef.create({
      uid: userId,
      username: username,
      dateOfCreate: millisecondsSinceEpoch,
      leaguePoint: leaguePoint,
    });

    res.status(200).send("Succesfully entered queue.");
    return;
  } catch (error) {
    console.error("Error:", error);
    res.status(500).send("Error while Entering Queue.");
    return;
  }
};

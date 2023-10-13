import * as admin from "firebase-admin";
import * as express from "express";


export const createDeleteRequestFunction: (
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
    const userRecord = await admin.auth().getUser(userId);
    const userLastSignInTime = Date.parse(userRecord.metadata.lastSignInTime);
    const lastSignedInDatePlus3Min = userLastSignInTime + 180000;
    const currentDate = new Date();

    const requestCreationDate = currentDate.getTime();

    if (lastSignedInDatePlus3Min > requestCreationDate) {
      res.status(400).send(
        "You need to wait 5 min after signed in to delete account.");
      return;
    }
    const twoWeekFromNowDate = new Date(
      currentDate.getFullYear(),
      currentDate.getMonth(),
      currentDate.getDate(),
      currentDate.getHours(),
      currentDate.getMinutes() + 2,
    );
    const twoWeekFromNow = twoWeekFromNowDate.getTime();

    const threeWeekFromNowDate = new Date(
      currentDate.getFullYear(),
      currentDate.getMonth(),
      currentDate.getDate(),
      currentDate.getHours(),
      currentDate.getMinutes() + 5,
    );
    const threeWeekFromNow = threeWeekFromNowDate.getTime();


    const deleteRequestRef = admin.firestore()
      .collection("delete_requests").doc(userId);

    await deleteRequestRef.set({
      uid: userId,
      createdDate: requestCreationDate,
      scheduledDisableDate: twoWeekFromNow,
      scheduledDeleteDate: threeWeekFromNow,
    });

    res.status(200).send("Deletion Request Succesfully created.");
    return;
  } catch (error) {
    console.log(error);
    console.error("Error:", error);
    res.status(500).send("Error while creating Delete Request.");
    return;
  }
};

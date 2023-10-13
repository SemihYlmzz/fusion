import * as admin from "firebase-admin";
import * as express from "express";


export const acceptGameFunction: (
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


    const user1GameRef = await admin.firestore().collection("games")
      .where("player1.uid", "==", userId).get();

    const user2GameRef = await admin.firestore().collection("games")
      .where("player2.uid", "==", userId).get();


    if (!user1GameRef.empty) {
      for (const game of user1GameRef.docs) {
        const acceptedUserIds = game.get("acceptedUserIds") || [];
        acceptedUserIds.push(userId);
        await game.ref.update({
          acceptedUserIds: acceptedUserIds,
        });
      }
      res.status(200).send("Deck refreshed successfully");
      return;
    } else if (!user2GameRef.empty) {
      for (const game of user2GameRef.docs) {
        const acceptedUserIds = game.get("acceptedUserIds") || [];
        acceptedUserIds.push(userId);
        await game.ref.update({
          acceptedUserIds: acceptedUserIds,
        });
      }
      res.status(200).send("success");
      return;
    }
    res.status(400).send("no-active-game");
    return;
  } catch (error) {
    console.error("Error:", error);
    res.status(500).send("An error occurred while refreshing the deck.");
  }
};

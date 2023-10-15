import * as admin from "firebase-admin";
import * as express from "express";


export const opponentEscapedWinFunction: (
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


    const unEndedGameRef = await admin.firestore().collection("games")
      .where("acceptedUserIds", "array-contains", userId)
      .where("gameStatus", "==", 0).get();


    if (unEndedGameRef.empty) {
      res.status(400).send("no-active-game");
    }

    for (const game of unEndedGameRef.docs) {
      const acceptedUserIds = game.get("acceptedUserIds");

      if (acceptedUserIds.length < 2) {
        const player1sUid = game.get("player1").uid;
        const isPlayer1 = player1sUid == userId;

        if (isPlayer1) {
          await game.ref.update({
            gameStatus: 1,
          });
        } else {
          await game.ref.update({
            gameStatus: 2,
          });
        }
      }
    }
    res.status(200).send("successful");
    return;
  } catch (error) {
    console.error("Error:", error);
    res.status(500).send("An error occurred while refreshing the deck.");
  }
};

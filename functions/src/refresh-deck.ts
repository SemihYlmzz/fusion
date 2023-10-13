import {deckOptions, getRandomUniqueItemsFromArray} from "./deck-utils";
import * as admin from "firebase-admin";
import * as express from "express";


export const refreshDeckFunction: (
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

    const deck = getRandomUniqueItemsFromArray(deckOptions, 8);
    const userRef = admin.firestore().collection("users").doc(userId);
    await userRef.update({
      deck: deck,
    });
    res.status(200).send("Deck refreshed successfully");
  } catch (error) {
    console.error("Error:", error);
    res.status(500).send("An error occurred while refreshing the deck.");
  }
};

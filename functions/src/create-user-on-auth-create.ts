import {deckOptions, getRandomUniqueItemsFromArray} from "./deck-utils";

import * as functions from "firebase-functions";
import * as admin from "firebase-admin";


export const createUserOnAuthCreateFunction: (
      user: functions.auth.UserRecord,
    ) => void | Promise<void> = async (user) => {
      const deck = getRandomUniqueItemsFromArray(deckOptions, 8);

      admin.firestore().collection("users").doc(user.uid).set({
        "accountDeletionScheduledDate": null,
        "dateOfCreate": Date.now(),
        "email": user.email,
        "uid": user.uid,
        "username": "",
        "accountnameChangeEligibilityDate": Date.now(),
        "lastActivityDate": Date.now(),
        "gameId": null,
        "deck": deck,
      });
      return;
    };

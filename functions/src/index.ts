import * as functions from "firebase-functions";
import * as admin from "firebase-admin";

import {changeUsernameFunction} from "./change-username";
import {createDeleteRequestFunction} from "./create-delete-request";
import {createGameWithNormalQueueFunction}
  from "./create-game-with-normal-queue";
import {createUserOnAuthCreateFunction} from "./create-user-on-auth-create";
import {deleteRequestAccountDeleterFunction}
  from "./delete-request-account-deleter";
import {deleteRequestAuthDisablerFunction}
  from "./delete-request-auth-disabler";
import {enterNormalQueueFunction} from "./enter-normal-queue";
import {refreshDeckFunction} from "./refresh-deck";
import {acceptGameFunction} from "./accept-game";
import {opponentEscapedWinFunction} from "./opponent-escaped-win";
admin.initializeApp();


exports.changeUsername = functions.https.onRequest(
  changeUsernameFunction
);
exports.createDeleteRequest = functions.https.onRequest(
  createDeleteRequestFunction
);
exports.createGameWithNormalQueue = functions.firestore.document(
  "queue/{docId}")
  .onCreate(createGameWithNormalQueueFunction);
exports.createUserOnAuthCreate = functions.auth.user().onCreate(
  createUserOnAuthCreateFunction
);

exports.deleteRequestAccountDeleter = functions.pubsub.schedule("0 5 * * *")
  .timeZone("UTC")
  .onRun(deleteRequestAccountDeleterFunction);
exports.deleteRequestAuthDisabler = functions.pubsub.schedule("0 5 * * *")
  .timeZone("UTC")
  .onRun(deleteRequestAuthDisablerFunction);
exports.enterNormalQueue = functions.https.onRequest(
  enterNormalQueueFunction
);
exports.refreshDeck = functions.https.onRequest(
  refreshDeckFunction
);
exports.acceptGame = functions.https.onRequest(
  acceptGameFunction
);
exports.opponentEscapedWin = functions.https.onRequest(
  opponentEscapedWinFunction
);

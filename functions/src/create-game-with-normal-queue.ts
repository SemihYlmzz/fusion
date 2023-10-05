import * as admin from "firebase-admin";

/**
    @param {snap} snap - The int which hold how many random element you want.
     */
export async function createGameWithNormalQueueFunction() {
  const db = admin.firestore();
  const queueRef = db.collection("queue");
  const usersRef = db.collection("users");
  const gamesRef = db.collection("games");
  const snapshot = await queueRef
    .orderBy("dateOfCreate", "asc")
    .limit(2)
    .get();
  if (snapshot.size < 2) {
    return null;
  }
  const batch = db.batch();
  const playerNames = snapshot.docs.map((doc) => doc.data().username);
  const playerUids = snapshot.docs.map((doc) => doc.data().uid);
  const gameDoc = gamesRef.doc();
  const gameDocData = {
    gameId: gameDoc.id,
    player1: {
      username: playerNames[0],
      isReady: false,
    },
    player2: {
      username: playerNames[1],
      isReady: false,
    },
    gameStatus: 0,
    createdAt: Date.now(),
    updatedAt: Date.now(),
    currentTurn: 0,
  };
  batch.set(gameDoc, gameDocData);
  snapshot.docs.forEach((doc) => {
    batch.delete(doc.ref);
  });
  playerUids.forEach(async (uid) => {
    const userDoc = usersRef.doc(uid);
    batch.update(userDoc, {
      gameId: gameDoc.id,
    });
  });
  await batch.commit();
  return null;
}

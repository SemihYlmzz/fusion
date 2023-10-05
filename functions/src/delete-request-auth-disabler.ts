import * as admin from "firebase-admin";


/**
      Creates a user document in Firestore when a new user is created.

    @param {context} context - Null.
    @return {Promise} Null.
     */
export async function deleteRequestAuthDisablerFunction() {
  const nowMillis = Date.now();
  const deleteRequestsRef = admin.firestore()
    .collection("delete_requests");

  const scheduledDeleteDateEndedRequests = await deleteRequestsRef
    .where("scheduledDisableDate", "<=", nowMillis)
    .get();

  const batch = admin.firestore().batch();

  for (const request of scheduledDeleteDateEndedRequests.docs) {
    const uid = request.data().uid;
    const requestCreationDate = request.data().requestCreationDate;
    const userRecord = await admin.auth().getUser(uid);
    const userLastSignInTime = Date.parse(userRecord.metadata.lastSignInTime);

    if (userLastSignInTime < requestCreationDate) {
      await admin.auth().updateUser(uid, {disabled: true});
    }
  }

  await batch.commit();

  console.log("Old Delete Requested Users Deleted!");
  return null;
}


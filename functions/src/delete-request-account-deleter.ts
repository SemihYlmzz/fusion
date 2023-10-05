import * as admin from "firebase-admin";


/**
      Creates a user document in Firestore when a new user is created.

    @param {context} context - Null.
    @return {Promise} Null.
     */
export async function deleteRequestAccountDeleterFunction() {
  const nowMillis = Date.now();
  const deleteRequestsRef = admin.firestore()
    .collection("delete_requests");

  const scheduledDeleteDateEndedRequests = await deleteRequestsRef
    .where("scheduledDeleteDate", "<=", nowMillis)
    .get();

  const batch = admin.firestore().batch();
  const deletedUserUIDs: string[] = [];

  for (const request of scheduledDeleteDateEndedRequests.docs) {
    const uid = request.data().uid;
    const requestCreationDate = request.data().requestCreationDate;
    const userRecord = await admin.auth().getUser(uid);
    const userLastSignInTime =
        Date.parse(userRecord.metadata.lastSignInTime);

    if (userLastSignInTime < requestCreationDate && userRecord.disabled) {
      const userDocRef = admin.firestore().collection("users").doc(uid);
      batch.delete(userDocRef);
      batch.delete(request.ref);
      deletedUserUIDs.push(uid);
    } else {
      batch.delete(request.ref);
    }
  }

  for (const uidToDelete of deletedUserUIDs) {
    try {
      await admin.auth().deleteUser(uidToDelete);
      console.log(`Firebase Auth User deleted for UID: ${uidToDelete}`);
    } catch (error) {
      console.error(
        `Error deleting Firebase Auth User for UID: ${uidToDelete}`,
        error,
      );
    }
  }
  await batch.commit();

  console.log("Old Delete Requested Users Deleted!");
  return null;
}

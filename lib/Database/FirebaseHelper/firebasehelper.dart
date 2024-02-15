


class Firestore_Helper {
  Firestore_Helper._();

  static final Firestore_Helper firestore_helper = Firestore_Helper._();

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  addContact({required Map<String, dynamic> user_data}) async {
    await firestore.collection("user").doc("id").set(user_data);
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> fetchContact() {
    return firestore.collection("user").where("id").snapshots();
  }

  Future<void> deleteUser({required var deleteData}) async {
    await firestore.collection("user").doc("$deleteData").delete();
  }
}

mixin instance {
}

class FirebaseFirestore {
  collection(String s) {}
}

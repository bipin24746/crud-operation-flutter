import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';

class databaseProduct {
  final CollectionReference productDetails =
      FirebaseFirestore.instance.collection('products details');
//create
  Future<void> ADDPRODUCT(String title, String description, String price) {
    return productDetails.add({
      "productTitle": title,
      "productDescription": description,
      "productPrice": price,
    });
  }

//read
  Stream<QuerySnapshot> ViewProduct() {
    return productDetails.snapshots();
  }

  //update
  Future<void> UpdateProduct(
      String id, String title, String description, String price) {
    return productDetails.doc(id).update({
      "productTitle": title,
      "productDescription": description,
      "productPrice": price,
    });
  }

  //delete

  Future<void> DeleteProduct(String id) {
    return productDetails.doc(id).delete();
  }
}

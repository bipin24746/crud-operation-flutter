import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud/database/addDatabaseProduct.dart';
import 'package:crud/screens/pages/deleteProducts.dart';
import 'package:flutter/material.dart';
import 'updateProduct.dart';

class Readdata extends StatefulWidget {
  const Readdata({super.key});

  @override
  State<Readdata> createState() => _ReaddataState();
}

class _ReaddataState extends State<Readdata> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "E-Vault",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder(
              stream: databaseProduct().ViewProduct(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasData) {
                  List<DocumentSnapshot> data = snapshot.data!.docs;
                  return ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      DocumentSnapshot eachDoc = data[index];
                      Map<String, dynamic> map =
                          eachDoc.data() as Map<String, dynamic>;

                      String title = map["productTitle"];
                      String description = map["productDescription"];
                      String price = map["productPrice"];
                      String docId = eachDoc.id; // Retrieve the document ID

                      return Container(
                        padding: EdgeInsets.all(8),
                        margin: EdgeInsets.symmetric(vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Title: $title",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold)),
                                SizedBox(height: 4),
                                Text("Description: $description"),
                                SizedBox(height: 4),
                                Text("Price: $price"),
                              ],
                            ),
                            Spacer(),
                            Column(
                              children: [
                                IconButton(
                                  icon: Icon(Icons.edit),
                                  onPressed: () {
                                    // Navigate to UpdateProduct and pass current values
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => UpdateProduct(
                                          docId: docId,
                                          initialTitle: title,
                                          initialDescription: description,
                                          initialPrice: price,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                                Deleteproducts(
                                    productId:
                                        docId), // Pass the document ID to DeleteProductButton
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

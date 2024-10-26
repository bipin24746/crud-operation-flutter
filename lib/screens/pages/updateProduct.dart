import 'package:crud/database/addDatabaseProduct.dart';
import 'package:flutter/material.dart';

class UpdateProduct extends StatelessWidget {
  final String docId;
  final String initialTitle;
  final String initialDescription;
  final String initialPrice;

  UpdateProduct({
    required this.docId,
    required this.initialTitle,
    required this.initialDescription,
    required this.initialPrice,
    super.key,
  });

  final TextEditingController productTitle = TextEditingController();
  final TextEditingController productDescription = TextEditingController();
  final TextEditingController productPrice = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Set initial values for controllers
    productTitle.text = initialTitle;
    productDescription.text = initialDescription;
    productPrice.text = initialPrice;

    return Scaffold(
      appBar: AppBar(
        title: Text("Update Product"),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            TextFormField(
              controller: productTitle,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                hintText: "Enter Product Title",
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: productDescription,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                hintText: "Enter Product Description",
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: productPrice,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                hintText: "Enter Product Price",
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
              onPressed: () {
                // Use databaseProduct's UpdateProduct method to update Firestore
                databaseProduct()
                    .UpdateProduct(
                  docId,
                  productTitle.text,
                  productDescription.text,
                  productPrice.text,
                )
                    .then((_) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Product Updated Successfully!")),
                  );
                  Navigator.pop(context);
                }).catchError((error) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Update Failed: $error")),
                  );
                });
              },
              child: Text(
                "Update",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

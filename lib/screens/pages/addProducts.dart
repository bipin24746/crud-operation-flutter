import 'package:crud/database/addDatabaseProduct.dart';
import 'package:flutter/material.dart';

class AddProducts extends StatefulWidget {
  const AddProducts({super.key});

  @override
  State<AddProducts> createState() => _AddProductsState();
}

class _AddProductsState extends State<AddProducts> {
  TextEditingController productTitle = TextEditingController();
  TextEditingController productDescription = TextEditingController();

  TextEditingController productPrice = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          centerTitle: true,
          title: Text(
            "Add Products",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.blue),
      body: Column(
        children: [
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 18, right: 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Product Title"),
                TextFormField(
                    controller: productTitle,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      hintText: "Enter Product Title",
                    )),
                Text("Product Description"),
                TextFormField(
                    controller: productDescription,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      hintText: "Enter Product Description",
                    )),
                Text("Product Price"),
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
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Column(
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                onPressed: () {
                  databaseProduct().ADDPRODUCT(
                    productTitle.text,
                    productDescription.text,
                    productPrice.text,
                  );
                  print("Product added!");
                  productTitle.clear();
                  productDescription.clear();
                  productPrice.clear();
                },
                child: Text(
                  "Submit",
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

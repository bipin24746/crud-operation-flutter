import 'package:crud/database/addDatabaseProduct.dart';
import 'package:flutter/material.dart';

class Deleteproducts extends StatelessWidget {
  final String productId; // Product ID required for deletion

  const Deleteproducts({Key? key, required this.productId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () async {
        bool confirmed = await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text("Delete Product"),
            content: Text("Are you sure you want to delete this product?"),
            actions: [
              TextButton(
                child: Text("Cancel"),
                onPressed: () => Navigator.pop(context, false),
              ),
              TextButton(
                child: Text("Delete", style: TextStyle(color: Colors.red)),
                onPressed: () => Navigator.pop(context, true),
              ),
            ],
          ),
        );

        if (confirmed) {
          await databaseProduct().DeleteProduct(productId);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Product deleted successfully!")),
          );
        }
      },
      icon: Icon(Icons.delete, color: Colors.red),
    );
  }
}

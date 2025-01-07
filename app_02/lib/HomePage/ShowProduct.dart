import 'package:flutter/material.dart';

class ShowProduct extends StatelessWidget {
  final String productName;
  final String productDescription;
  final double productPrice;
  final String productImage;

  ShowProduct({
    required this.productName,
    required this.productDescription,
    required this.productPrice,
    required this.productImage,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.network(
                productImage,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 16),
            Text(
              productName,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              '\$${productPrice.toStringAsFixed(2)}',
              style: TextStyle(
                fontSize: 20,
                color: Colors.green,
              ),
            ),
            SizedBox(height: 16),
            Text(
              productDescription,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

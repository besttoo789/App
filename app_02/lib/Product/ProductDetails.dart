import 'package:flutter/material.dart';

class ShowProduct extends StatelessWidget {
  final String productName;
  final String productDescription;
  final double productUnit;
  final String productImage;

  ShowProduct({
    required this.productName,
    required this.productDescription,
    required this.productUnit,
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
            Image.network(
              'https://media1.giphy.com/media/1OrIIOIcRTDaNidc5p/giphy.gif?cid=6c09b952sgwn7px1x88rlvp95ta0b2fhcrr8oxtfks85dt7b&ep=v1_gifs_search&rid=giphy.gif&ct=g',
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
              'จำนวนในสต็อก: $productUnit',
              style: TextStyle(
                fontSize: 20,
                color: const Color.fromARGB(255, 0, 0, 0),
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

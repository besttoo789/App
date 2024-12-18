import 'package:flutter/material.dart';

class ProductListPage extends StatelessWidget {
  // ตัวอย่างข้อมูลสินค้า
  final List<Product> products = [
    Product(
      name: 'Product 1',
      description: 'This is product 1 description',
      price: 199.99,
      imageUrl: 'https://via.placeholder.com/150',
    ),
    Product(
      name: 'Product 2',
      description: 'This is product 2 description',
      price: 299.99,
      imageUrl: 'https://via.placeholder.com/150',
    ),
    Product(
      name: 'Product 3',
      description: 'This is product 3 description',
      price: 99.99,
      imageUrl: 'https://via.placeholder.com/150',
    ),
    Product(
      name: 'Product 4',
      description: 'This is product 4 description',
      price: 150.99,
      imageUrl: 'https://via.placeholder.com/150',
    ),
    Product(
      name: 'Product 5',
      description: 'This is product 5 description',
      price: 249.99,
      imageUrl: 'https://via.placeholder.com/150',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product List'),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ProductCard(product: products[index]);
        },
      ),
    );
  }
}

class Product {
  final String name;
  final String description;
  final double price;
  final String imageUrl;

  Product({
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
  });
}

class ProductCard extends StatelessWidget {
  final Product product;

  ProductCard({required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            Image.network(
              product.imageUrl,
              height: 100,
              width: 100,
              fit: BoxFit.cover,
            ),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    product.description,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 5),
                  Text(
                    '\$${product.price.toStringAsFixed(2)}',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      // Action when user presses the button
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text(product.name),
                            content: Text('More details about ${product.name}'),
                            actions: <Widget>[
                              TextButton(
                                child: Text('Close'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Text('View Details'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

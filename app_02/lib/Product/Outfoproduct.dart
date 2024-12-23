import 'package:flutter/material.dart';

class RemoveProductPage extends StatefulWidget {
  @override
  _RemoveProductPageState createState() => _RemoveProductPageState();
}

class _RemoveProductPageState extends State<RemoveProductPage> {
  List<Product> allProducts = getProductsFromDatabase();
  String query = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('นำออกจากสต็อก'),
        backgroundColor: Colors.red,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (query) {
                setState(() {
                  this.query = query;
                });
              },
              decoration: InputDecoration(
                labelText: 'ค้นหาสินค้า',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _filterProducts().length,
              itemBuilder: (context, index) {
                return _buildProductCard(context, _filterProducts()[index]);
              },
            ),
          ),
        ],
      ),
    );
  }

  List<Product> _filterProducts() {
    if (query.isEmpty) {
      return allProducts;
    } else {
      return allProducts
          .where((product) =>
              product.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
  }

  Widget _buildProductCard(BuildContext context, Product product) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: Icon(Icons.production_quantity_limits, color: Colors.red),
        title: Text(product.name),
        subtitle: Text('สินค้าคงเหลือ: ${product.stock} ชิ้น'),
        trailing: IconButton(
          icon: Icon(Icons.remove_circle_outline),
          onPressed: () {
            _removeProduct(context, product);
          },
        ),
      ),
    );
  }

  void _removeProduct(BuildContext context, Product product) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('ยืนยันการนำออก'),
          content: Text(
              'คุณต้องการนำสินค้า "${product.name}" ออกจากสต็อกใช่หรือไม่?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('ยกเลิก'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  product.stock = 0; // นำออกจากสต็อกโดยการตั้งจำนวนสต็อกเป็น 0
                });
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('${product.name} ถูกนำออกจากสต็อก')),
                );
              },
              child: const Text('ยืนยัน'),
            ),
          ],
        );
      },
    );
  }
}

class Product {
  final String name;
  int stock;

  Product({required this.name, required this.stock});
}

List<Product> getProductsFromDatabase() {
  // Mock data for demonstration
  return [
    Product(name: 'สินค้า A', stock: 50),
    Product(name: 'สินค้า B', stock: 20),
    Product(name: 'สินค้า C', stock: 100),
  ];
}

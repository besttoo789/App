import 'package:flutter/material.dart';
import 'package:app_02/Product/Search.dart';

class Product {
  final String name;
  int stock;
  final String imageUrl; // Added image URL property

  Product({required this.name, required this.stock, required this.imageUrl});
}

List<Product> getProductsFromDatabase() {
  // Mock data for demonstration with images
  return [
    Product(
        name: 'สินค้า A',
        stock: 50,
        imageUrl:
            'https://www.siamsport.co.th/static/ddc8f1b1-8c85-4521-89bb-336a8274c468.jpg'),
    Product(
        name: 'สินค้า B',
        stock: 20,
        imageUrl:
            'https://www.siamsport.co.th/static/ddc8f1b1-8c85-4521-89bb-336a8274c468.jpg'),
    Product(
        name: 'สินค้า C',
        stock: 100,
        imageUrl:
            'https://www.siamsport.co.th/static/ddc8f1b1-8c85-4521-89bb-336a8274c468.jpg'),
    Product(
        name: 'สินค้า D',
        stock: 50,
        imageUrl:
            'https://www.siamsport.co.th/static/ddc8f1b1-8c85-4521-89bb-336a8274c468.jpg'),
    Product(
        name: 'สินค้า E',
        stock: 20,
        imageUrl:
            'https://www.siamsport.co.th/static/ddc8f1b1-8c85-4521-89bb-336a8274c468.jpg'),
    Product(
        name: 'สินค้า F',
        stock: 100,
        imageUrl:
            'https://www.siamsport.co.th/static/ddc8f1b1-8c85-4521-89bb-336a8274c468.jpg'),
  ];
}

class ProductListPage extends StatelessWidget {
  final List<Product> products;

  ProductListPage({Key? key})
      : products = getProductsFromDatabase(),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('รายการสินค้า'),
        backgroundColor: Colors.red,
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProductSearchPage()),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: products.length,
          itemBuilder: (context, index) {
            return _buildProductCard(context, products[index]);
          },
        ),
      ),
    );
  }

  Widget _buildProductCard(BuildContext context, Product product) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                product.imageUrl,
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    'สินค้าคงเหลือ: ${product.stock} ชิ้น',
                    style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                  ),
                ],
              ),
            ),
            IconButton(
              icon: Icon(Icons.info_outline, color: Colors.red),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductDetailPage(product: product),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ProductDetailPage extends StatefulWidget {
  final Product product;

  ProductDetailPage({Key? key, required this.product}) : super(key: key);

  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  late TextEditingController _stockController;

  @override
  void initState() {
    super.initState();
    _stockController =
        TextEditingController(text: widget.product.stock.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('รายละเอียดสินค้า'),
        backgroundColor: Colors.red,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  widget.product.imageUrl,
                  width: 200,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 16),
              Text('ชื่อสินค้า: ${widget.product.name}',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              Text('จำนวนในสต็อก: ', style: TextStyle(fontSize: 18)),
              TextField(
                controller: _stockController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'จำนวนสต็อก',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    widget.product.stock = int.parse(_stockController.text);
                  });
                },
                child: const Text('อัปเดตสต็อก'),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

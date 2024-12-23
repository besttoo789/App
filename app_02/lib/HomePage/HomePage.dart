import 'package:flutter/material.dart';
import 'package:app_02/AddProductPage/AddProduct.dart';
import 'package:app_02/HistoryPage/HistoryProduct.dart';
import 'package:app_02/Product/Outfoproduct.dart';
import 'package:app_02/Product/Product.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  int _selectedIndex = 0; // Selected index for the BottomNavigationBar
  List<Product> allProducts = [];
  List<Product> filteredProducts = [];

  @override
  void initState() {
    super.initState();
    allProducts = getProductsFromDatabase();
    filteredProducts = allProducts;
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // This function determines the widget to display based on the selected tab.

  @override
  Widget build(BuildContext context) {
    int availableStock = 100;
    int damagedStock = 5;

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: <Widget>[
            const SizedBox(height: 50),
            _buildSquareBoxWithText(
              context,
              'สวัสดีคุณ Besttoo',
              'สินค้าคงเหลือ: $availableStock ชิ้น\nสินค้าเสียหาย: $damagedStock ชิ้น',
              AddProductPage(),
            ),
            const SizedBox(height: 20),
            const Text(
              'หมวดหมู่',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _buildCategoryButton(
                    context, 'images/box.png', 'สินค้า', ProductListPage()),
                const SizedBox(width: 15),
                _buildCategoryButton(context, 'images/new-product.png',
                    'เพิ่มเข้า', AddProductPage()),
                const SizedBox(width: 15),
                _buildCategoryButton(context, 'images/out-of-stock.png',
                    'นำออก', RemoveProductPage()),
                const SizedBox(width: 15),
                _buildCategoryButton(
                    context, 'images/file.png', 'ประวัติ', HistoryPage()),
              ],
            ),
            const SizedBox(height: 20),
            const SizedBox(height: 20),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'รายการล่าสุด',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _buildSquareImageWithDescription(
                    context, 'images/new-product.png', '', ProductListPage(),
                    width: 120, height: 120, withBorder: true),
                const SizedBox(width: 20),
                _buildSquareImageWithDescription(
                    context, 'images/new-product.png', '', AddProductPage(),
                    width: 120, height: 120, withBorder: true),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _buildSquareImageWithDescription(
                    context, 'images/new-product.png', '', ProductListPage(),
                    width: 120, height: 120, withBorder: true),
                const SizedBox(width: 20),
                _buildSquareImageWithDescription(
                    context, 'images/new-product.png', '', AddProductPage(),
                    width: 120, height: 120, withBorder: true),
              ],
            ),
            const SizedBox(height: 15),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.barcode_reader, color: Colors.white),
        backgroundColor: Colors.red,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex, // Current selected index
        onTap: _onItemTapped, // Callback for tab change
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            backgroundColor: Colors.red,
            label: 'สินค้า',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_box),
            label: 'เพิ่มสินค้า',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'ประวัติ',
          ),
        ],
      ),
    );
  }

  Widget _buildSquareBoxWithText(
      BuildContext context, String text, String description, Widget nextPage,
      {double width = 350, double height = 200}) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => nextPage),
        );
      },
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Colors.red.shade100],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(20.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 12,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                text,
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                description,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryButton(
      BuildContext context, String imagePath, String label, Widget nextPage) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => nextPage),
        );
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: Colors.red.shade100,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 8,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(imagePath, fit: BoxFit.cover),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildSquareImageWithDescription(BuildContext context,
      String imagePath, String description, Widget nextPage,
      {double width = 120, double height = 120, bool withBorder = false}) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => nextPage),
        );
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: withBorder
                ? BoxDecoration(
                    border: Border.all(
                      color: Colors.redAccent,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(20.0),
                  )
                : null,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: SizedBox(
                width: width,
                height: height,
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(description,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              )),
        ],
      ),
    );
  }
}

List<Product> getProductsFromDatabase() {
  return [
    Product(name: 'สินค้า A', stock: 50),
    Product(name: 'สินค้า B', stock: 20),
  ];
}

class Product {
  final String name;
  final int stock;

  Product({required this.name, required this.stock});
}

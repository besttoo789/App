import 'package:flutter/material.dart';
import 'package:app_02/AddProductPage/AddProduct.dart';
import 'package:app_02/HistoryPage/HistoryProduct.dart';
import 'package:app_02/Product/Outfoproduct.dart';
import 'package:app_02/Product/Product.dart';
import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:app_02/Product/ProductDetails.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login App',
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    int availableStock = 100;
    int damagedStock = 5;
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text('ระบบจัดการสินค้า'),
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        actions: [
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              // Handle login button press
              print('Login button pressed');
            },
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              const Color.fromARGB(255, 229, 9, 20), // Red color on top
              Color.fromARGB(255, 245, 245, 241), // White color on bottom
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(30),
          child: Column(
            children: <Widget>[
              const SizedBox(height: 50),
              _buildSquareBoxWithText(
                context,
                'สวัสดีคุณ : $availableStock',
                'สินค้าคงทั้งหมด: $availableStock ชิ้น\nสินค้าเสียหาย: $damagedStock ชิ้น',
                AddProductPage(),
                width: screenWidth * 0.9,
                height: screenHeight * 0.25,
              ),
              const SizedBox(height: 20),
              const Text(
                'หมวดหมู่',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 8,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    _buildCategoryButton(
                        context, 'images/box.png', 'สินค้า', ProductListPage()),
                    const SizedBox(width: 15),
                    _buildCategoryButton(context, 'images/new-product.png',
                        'เพิ่มเข้า', AddProductPage()),
                    const SizedBox(width: 15),
                    _buildCategoryButton(context, 'images/out-of-stock.png',
                        'นำออก', Outfoproduct()),
                    const SizedBox(width: 15),
                    _buildCategoryButton(
                        context, 'images/file.png', 'ประวัติ', HistoryPage()),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'รายการล่าสุด',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 34, 31, 31),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  _buildSquareImageWithDescription(
                      context,
                      'https://ihcupload.s3.ap-southeast-1.amazonaws.com/img/product/products65208_800.jpg',
                      '',
                      ShowProduct(
                          productName: 'สินค้า A',
                          productDescription: 'รายละเอียดสินค้า A',
                          productUnit: 100.0,
                          productImage:
                              'https://static1.howtogeekimages.com/wordpress/wp-content/uploads/2024/04/53366612939_4a328f5233_o.jpg'),
                      width: screenWidth * 0.3,
                      height: screenHeight * 0.15,
                      withBorder: true),
                  const SizedBox(width: 20),
                  _buildSquareImageWithDescription(
                      context,
                      'https://static1.howtogeekimages.com/wordpress/wp-content/uploads/2024/04/53366612939_4a328f5233_o.jpg',
                      '',
                      AddProductPage(),
                      width: screenWidth * 0.3,
                      height: screenHeight * 0.15,
                      withBorder: true),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  _buildSquareImageWithDescription(
                      context,
                      'https://gi.lnwfile.com/brgn7y.webp',
                      '',
                      ProductListPage(),
                      width: screenWidth * 0.3,
                      height: screenHeight * 0.15,
                      withBorder: true),
                  const SizedBox(width: 20),
                  _buildSquareImageWithDescription(
                      context,
                      'https://gi.lnwfile.com/brgn7y.webp',
                      '',
                      AddProductPage(),
                      width: screenWidth * 0.3,
                      height: screenHeight * 0.15,
                      withBorder: true),
                ],
              ),
              const SizedBox(height: 15),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          var result = await BarcodeScanner.scan();
          if (result.type == ResultType.Barcode) {
            // Handle the scanned barcode result here
            print('Scanned barcode: ${result.rawContent}');
          }
        },
        child: const Icon(Icons.qr_code, color: Colors.white),
        backgroundColor: Color.fromARGB(255, 229, 9, 20),
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
            colors: [
              const Color.fromARGB(255, 245, 245, 241),
              Color.fromARGB(255, 245, 245, 241),
            ],
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
                  color: Color.fromARGB(255, 34, 31, 31),
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                description,
                style: const TextStyle(
                  fontSize: 14,
                  color: Color.fromARGB(255, 34, 31, 31),
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
            width: 55,
            height: 60,
            decoration: BoxDecoration(
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
                child: Image.network(
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

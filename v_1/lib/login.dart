import 'package:flutter/material.dart';
import 'package:v_1/Product.dart';
import 'AddProductPage.dart';
import 'package:v_1/HistoryProduct.dart';
import 'package:v_1/level5.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 253, 255, 253),
      appBar: AppBar(
        title: const Text(''),
        backgroundColor: const Color.fromARGB(255, 241, 4, 32),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                // Square image at the top
                _buildSquareImageWithDescription(
                  context,
                  'images/Product.png',
                  '',
                  const Level5(),
                ),
                const SizedBox(height: 10),
                const Text(
                  'หมวดหมู่',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: _buildCircularImageWithDescription(context,
                          'images/box.png', 'product', ProductListPage()),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: _buildCircularImageWithDescription(
                        context,
                        'images/new-product.png',
                        'new-product.png',
                        AddProductPage(),
                      ),
                    ),
                    const SizedBox(width: 40),
                    Expanded(
                      child: _buildCircularImageWithDescription(
                        context,
                        'images/supplier.png',
                        'History product',
                        const Level3Page(),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'รายการ',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 30),
                // Level 5 images in grid format
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        _buildSquareImageWithDescription(
                          context,
                          'images/9.jpg',
                          '',
                          ProductListPage(),
                          width: 160,
                          height: 110,
                        ),
                        const SizedBox(width: 20),
                        _buildSquareImageWithDescription(
                          context,
                          'images/7.jpg',
                          '',
                          const Level5(),
                          width: 160,
                          height: 110,
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        _buildSquareImageWithDescription(
                          context,
                          'images/8.jpg',
                          '',
                          const Level5(),
                          width: 160,
                          height: 110,
                        ),
                        const SizedBox(width: 20),
                        _buildSquareImageWithDescription(
                          context,
                          'images/7.jpg',
                          '',
                          const Level5(),
                          width: 160,
                          height: 110,
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.red,
        child: Container(
          height: 30, // ปรับความสูงของ BottomAppBar
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              IconButton(
                onPressed: null,
                icon: Icon(Icons.home, color: Colors.white),
                iconSize: 24, // ขนาดของไอคอน
              ),
              IconButton(
                onPressed: null,
                icon: Icon(Icons.warehouse, color: Colors.white),
                iconSize: 24, // ขนาดของไอคอน
              ),
              IconButton(
                onPressed: null,
                icon: Icon(Icons.person, color: Colors.white),
                iconSize: 24, // ขนาดของไอคอน
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCircularImageWithDescription(BuildContext context,
      String imagePath, String description, Widget nextPage) {
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
          SizedBox(
            width: 80,
            height: 80,
            child: ClipOval(
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 5),
          Text(description,
              style: const TextStyle(fontSize: 14),
              textAlign: TextAlign.center),
        ],
      ),
    );
  }

  Widget _buildSquareImageWithDescription(BuildContext context,
      String imagePath, String description, Widget nextPage,
      {double width = 350, double height = 175}) {
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
          ClipRRect(
            borderRadius: BorderRadius.circular(15.0),
            child: SizedBox(
              width: width,
              height: height,
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 5),
          Text(description,
              style: const TextStyle(fontSize: 14),
              textAlign: TextAlign.center),
        ],
      ),
    );
  }
}

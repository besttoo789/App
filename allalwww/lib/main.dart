import 'package:allalwww/Test.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(useMaterial3: false).copyWith(
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildImageLayout(context),
          const SizedBox(height: 10),
          _buildButtonGrid(context),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showMenu(context);
        },
        child: const Icon(Icons.qr_code_scanner, color: Colors.white),
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      bottomNavigationBar: BottomAppBar(
        color: Colors.green,
        shape: const CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            IconButton(onPressed: null, icon: Icon(Icons.home)),
            IconButton(onPressed: null, icon: Icon(Icons.warehouse)),
            IconButton(onPressed: null, icon: Icon(Icons.person)),
          ],
        ),
      ),
    );
  }

  Widget _buildImageLayout(BuildContext context) {
    return Column(
      children: [
        _buildImageWithBox(context),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _buildImageWithBox(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(60),
      child: Container(
        width: 400,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 8.0,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset(
            'Images/NongNINE.jpg', // Correct path to the image
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget _buildButtonGrid(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        children: [
          _buildButtonRow(context, 'Images/5.jpg'),
          const SizedBox(height: 20),
          _buildButtonRow(context, 'Images/NongNINE.jpg'),
        ],
      ),
    );
  }

  Widget _buildButtonRow(BuildContext context, String imagePath) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildNavButton(context, 'Images/NongNINE.jpg'),
        _buildNavButton(context, 'Images/5.jpg'),
      ],
    );
  }

  Widget _buildNavButton(BuildContext context, String imagePath) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Test()),
        );
      },
      child: _buildImageBox(imagePath),
    );
  }

  Widget _buildImageBox(String imagePath) {
    return Container(
      width: 120,
      height: 120,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 4.0,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.asset(
          imagePath,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  void _showMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          height: 200,
          color: Colors.blue,
          child: Center(
            child: Text(
              'Menu Items',
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:main_app01/AddItemp.dart';
import 'package:main_app01/AddProduct.dart'; // Assuming AddProductPage is here

void main() => runApp(App05BottomBar());

class App05BottomBar extends StatelessWidget {
  const App05BottomBar({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light(useMaterial3: false).copyWith(
          iconTheme: const IconThemeData(color: Colors.white),
        ),
        home: HomePage(),
      );
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Center(
          child: _buildImageLayout(context),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: const Color.fromARGB(255, 0, 0, 0),
          child: Icon(Icons.qr_code_scanner, color: Colors.white),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        bottomNavigationBar: BottomAppBar(
          color: Colors.green,
          shape: const CircularNotchedRectangle(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.home),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.add_circle),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.warehouse),
              ),
            ],
          ),
        ),
      );

  // This function is used to display the large image and a grid of smaller images.
  Widget _buildImageLayout(BuildContext context) {
    return Column(
      mainAxisAlignment:
          MainAxisAlignment.center, // Center the column vertically
      crossAxisAlignment:
          CrossAxisAlignment.center, // Center the column horizontally
      children: [
        _buildImageWithBox(context), // Display the large image in a box
        const SizedBox(
            height: 16), // Space between the large image and the grid
        _build2x2ImageGrid(context), // Display a 2x2 image grid
      ],
    );
  }

  Widget _buildImageWithBox(BuildContext context) {
    return Container(
      alignment: Alignment.center, // Center the container
      padding: const EdgeInsets.all(80), // Padding around the container
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
          borderRadius: BorderRadius.circular(12), // Match image corner radius
          child: Image.asset(
            'Images/NongNINE.jpg.', // Path to the image
            fit: BoxFit.cover, // Ensure the image covers the entire box
          ),
        ),
      ),
    );
  }

  // This function creates a 2x2 grid of small images
  Widget _build2x2ImageGrid(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center, // Center horizontally
          children: [
            GestureDetector(
              onTap: () {
                // Navigate to AddProductPage when the 4th image is tapped
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddProductPage()),
                );
              },
              child: _buildImageBox(
                  'Images/NongNINE.jpg.'), // 4th image as clickable
            ),
            const SizedBox(width: 50), // Space between image boxes

            GestureDetector(
              onTap: () {
                // Navigate to AddProductPage when the 4th image is tapped
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddProductPage()),
                );
              },
              child: _buildImageBox(
                  'Images/NongNINE.jpg.'), // 4th image as clickable
            ),
          ],
        ),
        const SizedBox(height: 40), // Space between rows
        Row(
          mainAxisAlignment: MainAxisAlignment.center, // Center horizontally
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Additemp()),
                );
              },
              child: _buildImageBox('Images/NongNINE.jpg.'),
            ),
            const SizedBox(width: 50), // Space between image boxes
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddProductPage()),
                );
              },
              child: _buildImageBox(
                  'Images/NongNINE.jpg.'), // 4th image as clickable
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildImageBox(String imagePath) {
    return Container(
      width: 120, // Width of each image box
      height: 120, // Height of each image box
      decoration: BoxDecoration(
        color: Colors.white, // Background color of the box
        borderRadius: BorderRadius.circular(12), // Rounded corners
        boxShadow: const [
          BoxShadow(
            color: Colors.black26, // Shadow color
            blurRadius: 4.0, // Blur radius of the shadow
            offset: Offset(0, 2), // Shadow offset
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12), // Match image corner radius
        child: Image.asset(
          imagePath, // Path to the image
          fit: BoxFit.cover, // Ensure the image covers the entire box
        ),
      ),
    );
  }
}

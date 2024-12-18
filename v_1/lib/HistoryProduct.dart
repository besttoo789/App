import 'package:flutter/material.dart';
import 'package:v_1/chaYen.dart';

class Level3Page extends StatelessWidget {
  const Level3Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ประวัติการเพิ่ม - ลด'), // Title of the AppBar
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 50), // Space at the top
          const SizedBox(height: 16), // Space between text and image
          Image.asset('images/9.jpg', width: 200), // Main image
          const SizedBox(height: 30), // Space below the image

          // Level 4 images in grid format
          _buildImageRow(context),
          const SizedBox(height: 30),
          _buildImageRow(context),
        ],
      ),
    );
  }

  // Helper method to build a row of images
  Row _buildImageRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        _buildSquareImageWithDescription(
          context,
          'images/6.jpg',
          '', // Add description if needed
          const Chayen(), // Ensure the correct widget is being referenced
          width: 160,
          height: 110,
        ),
        const SizedBox(width: 20), // Space between images
        _buildSquareImageWithDescription(
          context,
          'images/6.jpg',
          '', // Add description if needed
          const Chayen(),
          width: 160,
          height: 110,
        ),
      ],
    );
  }

  // Builds an image with a description that navigates on tap
  Widget _buildSquareImageWithDescription(BuildContext context,
      String imagePath, String description, Widget destination,
      {double? width, double? height}) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => destination),
        );
      },
      child: Column(
        children: [
          Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15), // ปรับความโค้งที่นี่
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
          if (description.isNotEmpty)
            Text(description, textAlign: TextAlign.center),
        ],
      ),
    );
  }
}

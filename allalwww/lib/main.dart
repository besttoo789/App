import 'package:allalwww/Test.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light(useMaterial3: false).copyWith(
          iconTheme: const IconThemeData(color: Colors.white),
        ),
        home: const HomePage(),
      );
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.white, // Change background color
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Add SizedBox to make the image appear lower
            _buildImageLayout(context),
            const SizedBox(height: 40),
            // Buttons in the middle of the screen, 4 buttons
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildNavButton(context, 'Images/5.jpg', () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Test()),
                        );
                      }),
                      _buildNavButton(context, 'Images/5.jpg', () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Test()),
                        );
                      }),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildNavButton(context, 'Images/5.jpg', () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Test()),
                        );
                      }),
                      _buildNavButton(context, 'Images/5.jpg', () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Test()),
                        );
                      }),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      );

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
      padding: const EdgeInsets.all(80),
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

  Widget _buildNavButton(
      BuildContext context, String imagePath, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
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
}

import 'package:flutter/material.dart';
import 'Product/register.dart'; // นำเข้า RegisterPage
import 'HomePage/HomePage.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login App',
      home: FirstPage(),
    );
  }
}

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  void _login() {
    String username = _usernameController.text;
    String password = _passwordController.text;

    if (username.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter username and password')),
      );
    } else {
      // Handle successful login and navigate to login page
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                const LoginPage()), // นำทางไปยังหน้า login.dart
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE9F7F6), // ใช้สีพื้นหลังที่สดใส
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(40.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Image.asset('images/supplier.png', width: 120),
                const SizedBox(height: 30),
                Text(
                  'Coffee Shop',
                  style: GoogleFonts.montserrat(
                    textStyle: const TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w700,
                        color: Colors.black),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'BY NongNINE',
                  style: GoogleFonts.roboto(
                    textStyle:
                        const TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
                const SizedBox(height: 40),
                Text(
                  'จัดเก็บข้อมูลคลังสินค้า',
                  style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87),
                  ),
                ),
                const SizedBox(height: 40),
                TextField(
                  controller: _usernameController,
                  style: Theme.of(context).textTheme.bodyLarge,
                  textAlign: TextAlign.start,
                  decoration: InputDecoration(
                    labelText: 'Username',
                    labelStyle: GoogleFonts.roboto(color: Colors.black54),
                    prefixIcon: const Icon(Icons.person, color: Colors.black54),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: const BorderSide(color: Colors.transparent),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 20),
                  ),
                  obscureText: false,
                  keyboardType: TextInputType.text,
                ),
                const SizedBox(height: 15),
                TextField(
                  controller: _passwordController,
                  style: Theme.of(context).textTheme.bodyLarge,
                  textAlign: TextAlign.start,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    labelStyle: GoogleFonts.roboto(color: Colors.black54),
                    prefixIcon:
                        const Icon(Icons.vpn_key, color: Colors.black54),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: const BorderSide(color: Colors.transparent),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 20),
                  ),
                  obscureText: true,
                  keyboardType: TextInputType.visiblePassword,
                ),
                const SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: _login,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF76C7C0),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        elevation: 5, // เพิ่มเงาให้ปุ่ม
                      ),
                      child: Text(
                        'Login',
                        style: GoogleFonts.poppins(
                            color: Colors.white, fontSize: 18),
                      ),
                    ),
                    const SizedBox(width: 20),
                    ElevatedButton(
                      onPressed: () {
                        // Navigate to registration page
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const RegisterPage()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFEF8B8B),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        elevation: 5, // เพิ่มเงาให้ปุ่ม
                      ),
                      child: Text(
                        'REGISTER',
                        style: GoogleFonts.poppins(
                            color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'register.dart'; // นำเข้า RegisterPage
import 'login.dart'; // นำเข้า LoginPage
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
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(30.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Image.asset('images/NongNINE.jpg', width: 100),
                const SizedBox(height: 25),
                const Text('Coffee shop', style: TextStyle(fontSize: 25)),
                const Text('BY NongNINE', style: TextStyle(fontSize: 16)),
                const SizedBox(height: 20),
                Text(
                  'ลงทะเบียนกับอาจารย์ไนท์เชื่อมใจ',
                  style: GoogleFonts.chakraPetch(
                    textStyle: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Text(
                  'HOW TO ชงกาเเฟยังไงให้เทพๆ',
                  style: GoogleFonts.chakraPetch(
                    textStyle: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: _usernameController,
                  style: Theme.of(context).textTheme.bodyLarge,
                  textAlign: TextAlign.start,
                  decoration: const InputDecoration(
                    labelText: 'Username',
                    icon: Icon(Icons.person),
                    border: OutlineInputBorder(), // เพิ่มกรอบ
                    filled: true,
                    fillColor: Colors.white, // สีพื้นหลังของฟิลด์
                  ),
                  obscureText: false,
                  keyboardType: TextInputType.text,
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: _passwordController,
                  style: Theme.of(context).textTheme.bodyLarge,
                  textAlign: TextAlign.start,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    icon: Icon(Icons.vpn_key),
                    border: OutlineInputBorder(), // เพิ่มกรอบ
                    filled: true,
                    fillColor: Colors.white, // สีพื้นหลังของฟิลด์
                  ),
                  obscureText: true,
                  keyboardType: TextInputType.visiblePassword,
                ),
                const SizedBox(height: 50),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: _login,
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 133, 240, 129),
                      ),
                      child: const Text('Login'),
                    ),
                    const SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: () {
                        // Navigate to registration page
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const RegisterPage()),
                        );
                      },
                      child: const Text('REGISTER'),
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

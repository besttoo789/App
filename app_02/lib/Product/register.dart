import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // For FilteringTextInputFormatter
import 'package:google_fonts/google_fonts.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  bool _obscurePassword = true;

  void _togglePasswordVisibility() {
    setState(() {
      _obscurePassword = !_obscurePassword;
    });
  }

  void _register() {
    // Handle registration logic here
    // Add validation and handle the inputs
    if (_usernameController.text.isEmpty || _passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill all fields')),
      );
    } else {
      // Proceed with registration
      // You can implement your API call or any other logic here
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Register')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Image.asset('images/NongNINE.jpg', width: 100),
              const SizedBox(height: 50),
              Text(
                'ลงทะเบียนกับอาจารย์ไนท์เชื่อมใจ',
                style: GoogleFonts.chakraPetch(
                  textStyle: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 50),
              TextField(
                controller: _nameController,
                style: Theme.of(context).textTheme.bodyLarge,
                decoration: const InputDecoration(
                  labelText: 'ชื่อ - นามสกุล',
                  icon: Icon(Icons.person),
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                ),
                keyboardType: TextInputType.name,
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _usernameController,
                style: Theme.of(context).textTheme.bodyLarge,
                decoration: const InputDecoration(
                  labelText: 'Username',
                  icon: Icon(Icons.vpn_key),
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _passwordController,
                style: Theme.of(context).textTheme.bodyLarge,
                decoration: InputDecoration(
                  labelText: 'Password',
                  icon: const Icon(Icons.lock),
                  border: const OutlineInputBorder(),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscurePassword
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: _togglePasswordVisibility,
                  ),
                ),
                obscureText: _obscurePassword,
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _addressController,
                style: Theme.of(context).textTheme.bodyLarge,
                decoration: const InputDecoration(
                  labelText: 'ที่อยู่',
                  icon: Icon(Icons.home),
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                ),
                keyboardType: TextInputType.streetAddress,
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _phoneController,
                style: Theme.of(context).textTheme.bodyLarge,
                decoration: const InputDecoration(
                  labelText: 'เบอร์โทร',
                  icon: Icon(Icons.phone),
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                ),
                keyboardType: TextInputType.phone,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _register,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 194, 219, 239),
                ),
                child: const Text('Register'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

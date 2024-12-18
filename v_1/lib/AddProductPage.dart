import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class AddProductPage extends StatefulWidget {
  @override
  _AddProductPageState createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _productNameController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();
  final TextEditingController _unitPriceController = TextEditingController();
  final TextEditingController _barcodeController =
      TextEditingController(); // New controller for barcode
  String _stockStatus = 'Available';
  File? _image;

  void _addProduct() {
    if (_formKey.currentState!.validate()) {
      try {
        String productName = _productNameController.text;
        String category = _categoryController.text;
        int quantity = int.parse(_quantityController.text);
        double unitPrice = double.parse(_unitPriceController.text);

        double totalValue = quantity * unitPrice;

        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Product Added',
                style: TextStyle(fontWeight: FontWeight.bold)),
            content: Text(
              'Product: $productName\nCategory: $category\nQuantity: $quantity\nTotal Value: $totalValue\nStock Status: $_stockStatus',
              style: TextStyle(fontSize: 16),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text('OK', style: TextStyle(color: Colors.teal)),
              ),
            ],
          ),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Invalid input detected. Please try again.')),
        );
      }
    }
  }

  Future<void> _pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        _image = File(image.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('เพิ่มสินค้า'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              GestureDetector(
                onTap: _pickImage,
                child: Container(
                  width: double.infinity,
                  height: 200,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.teal),
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.grey[200],
                  ),
                  child: _image == null
                      ? Center(
                          child: Text('กรุณาเลือกภาพ',
                              style: TextStyle(color: Colors.teal)),
                        )
                      : Image.file(_image!, fit: BoxFit.cover),
                ),
              ),
              SizedBox(height: 25),
              TextFormField(
                controller: _productNameController,
                decoration: InputDecoration(
                  labelText: 'ชื่อสินค้า',
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.teal),
                  ),
                  prefixIcon: Icon(Icons.production_quantity_limits,
                      color: Colors.teal),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'โปรดใส่ชื่อสินค้า';
                  }
                  return null;
                },
              ),
              SizedBox(height: 25),
              TextFormField(
                controller: _categoryController,
                decoration: InputDecoration(
                  labelText: 'หมวดหมู่',
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.teal),
                  ),
                  prefixIcon: Icon(Icons.category, color: Colors.teal),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'โปรดใส่ชื่อหมวดหมู่';
                  }
                  return null;
                },
              ),
              SizedBox(height: 25),
              TextFormField(
                controller: _quantityController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'จำนวนคงเหลือ',
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.teal),
                  ),
                  prefixIcon:
                      Icon(Icons.format_list_numbered, color: Colors.teal),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'โปรดใส่จำนวนสินค้า';
                  }
                  if (int.tryParse(value) == null) {
                    return 'กรุณาใส่จำนวนที่เป็นตัวเลข';
                  }
                  return null;
                },
              ),
              SizedBox(height: 25),
              // Updated Barcode Field
              TextFormField(
                controller: _barcodeController,
                decoration: InputDecoration(
                  labelText: 'หมายเลข Barcode',
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.teal),
                  ),
                  prefixIcon: Icon(Icons.home_max, color: Colors.teal),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'โปรดใส่หมายเลข Barcode';
                  }
                  return null;
                },
              ),
              SizedBox(height: 25),
              TextFormField(
                controller: _unitPriceController,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                decoration: InputDecoration(
                  labelText: 'ราคา',
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.teal),
                  ),
                  prefixIcon: Icon(Icons.attach_money, color: Colors.teal),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'โปรดใส่ราคา';
                  }
                  if (double.tryParse(value) == null) {
                    return 'กรุณาใส่ราคาที่เป็นตัวเลข';
                  }
                  return null;
                },
              ),
              SizedBox(height: 25),
              DropdownButtonFormField<String>(
                value: _stockStatus,
                decoration: InputDecoration(
                  labelText: 'สถานะ',
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.teal),
                  ),
                ),
                items: ['Available', 'Out of Stock', 'Low Stock']
                    .map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _stockStatus = newValue!;
                  });
                },
              ),
              SizedBox(height: 50),
              ElevatedButton(
                onPressed: _addProduct,
                child: Text('เพิ่มสินค้า'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

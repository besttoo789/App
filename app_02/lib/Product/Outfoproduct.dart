import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:barcode_scan2/barcode_scan2.dart';

class Outfoproduct extends StatefulWidget {
  @override
  _OutfoproductState createState() => _OutfoproductState();
}

class _OutfoproductState extends State<Outfoproduct> {
  final TextEditingController _searchController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();
  final TextEditingController _remarksController = TextEditingController();
  final TextEditingController _recipientController = TextEditingController();
  String? _selectedProduct;

  final Map<String, Map<String, dynamic>> _productDetails = {
    'สินค้า A': {'category': 'หมวดหมู่ 1', 'stock': 50, 'unit': 'ชิ้น'},
    'สินค้า B': {'category': 'หมวดหมู่ 2', 'stock': 30, 'unit': 'กล่อง'},
    'สินค้า C': {'category': 'หมวดหมู่ 3', 'stock': 20, 'unit': 'กิโลกรัม'},
  };

  @override
  void dispose() {
    _searchController.dispose();
    _dateController.dispose();
    _quantityController.dispose();
    _remarksController.dispose();
    _recipientController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('เบิกจ่ายสินค้า'),
        backgroundColor: Colors.red,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSearchField(),
              SizedBox(height: 20),
              if (_selectedProduct != null) _buildProductDetails(),
              SizedBox(height: 20),
              _buildTextField(
                labelText: 'จำนวนที่เบิก',
                hintText: 'กรอกจำนวน',
                keyboardType: TextInputType.number,
                controller: _quantityController,
              ),
              SizedBox(height: 20),
              _buildTextField(
                labelText: 'ผู้รับสินค้า',
                hintText: 'กรอกชื่อผู้รับสินค้า',
                controller: _recipientController,
              ),
              SizedBox(height: 20),
              _buildDateField(context),
              SizedBox(height: 20),
              _buildTextField(
                labelText: 'หมายเหตุ',
                hintText: 'กรอกหมายเหตุเพิ่มเติม (ถ้ามี)',
                controller: _remarksController,
                maxLines: 3,
              ),
              SizedBox(height: 20),
              _buildActionButtons(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSearchField() {
    return Row(
      children: [
        Expanded(
          child: Autocomplete<String>(
            optionsBuilder: (TextEditingValue textEditingValue) {
              if (textEditingValue.text.isEmpty) {
                return const Iterable<String>.empty();
              }
              return _productDetails.keys.where((String option) {
                return option.contains(textEditingValue.text);
              });
            },
            onSelected: (String selection) {
              setState(() {
                _selectedProduct = selection;
                _searchController.text = selection;
              });
            },
            fieldViewBuilder:
                (context, controller, focusNode, onEditingComplete) {
              return TextField(
                controller: controller,
                focusNode: focusNode,
                decoration: InputDecoration(
                  labelText: 'ค้นหาสินค้า',
                  hintText: 'ค้นหาด้วยชื่อสินค้า หรือ บาร์โค้ด',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              );
            },
          ),
        ),
        SizedBox(width: 10),
        IconButton(
          icon: Icon(Icons.qr_code_scanner),
          onPressed: scanBarcode,
        ),
      ],
    );
  }

  Future<void> scanBarcode() async {
    if (await Permission.camera.request().isGranted) {
      try {
        var result = await BarcodeScanner.scan();
        if (result.rawContent.isNotEmpty) {
          setState(() {
            _searchController.text = result.rawContent;
            _selectedProduct = _productDetails.keys.firstWhere(
                (key) => key.contains(result.rawContent),
                orElse: () => '');

            if (_selectedProduct!.isNotEmpty) {
              _searchController.text = _selectedProduct!;
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('ไม่พบสินค้าที่ตรงกับบาร์โค้ด')),
              );
            }
          });
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error scanning barcode: $e')),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text('Camera permission is required to scan barcode')),
      );
    }
  }

  Widget _buildProductDetails() {
    if (_selectedProduct == null || _selectedProduct!.isEmpty)
      return SizedBox();

    final details = _productDetails[_selectedProduct!];
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('ชื่อสินค้า: $_selectedProduct',
                style: TextStyle(fontSize: 16)),
            SizedBox(height: 8),
            Text('หมวดหมู่: ${details?['category']}',
                style: TextStyle(fontSize: 16)),
            SizedBox(height: 8),
            Text('จำนวนคงเหลือ: ${details?['stock']}',
                style: TextStyle(fontSize: 16)),
            SizedBox(height: 8),
            Text('หน่วย: ${details?['unit']}', style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String labelText,
    required String hintText,
    TextInputType keyboardType = TextInputType.text,
    TextEditingController? controller,
    int maxLines = 1,
  }) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      keyboardType: keyboardType,
      maxLines: maxLines,
    );
  }

  Widget _buildDateField(BuildContext context) {
    return TextField(
      controller: _dateController,
      readOnly: true,
      decoration: InputDecoration(
        labelText: 'วันที่เบิก',
        hintText: 'เลือกวันที่',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        suffixIcon: Icon(Icons.calendar_today),
      ),
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(2000),
          lastDate: DateTime(2100),
        );
        if (pickedDate != null) {
          setState(() {
            _dateController.text =
                "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
          });
        }
      },
    );
  }

  Widget _buildActionButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ElevatedButton(
          onPressed: _onSubmit,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            elevation: 8,
          ),
          child: Text(
            'บันทึก',
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        TextButton(
          onPressed: _onCancel,
          style: TextButton.styleFrom(
            backgroundColor: Colors.red,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            textStyle: TextStyle(fontSize: 16),
          ),
          child: Text('ยกเลิก',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white)),
        ),
      ],
    );
  }

  void _onSubmit() {
    if (_selectedProduct == null ||
        _quantityController.text.isEmpty ||
        _recipientController.text.isEmpty ||
        _dateController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('กรุณากรอกข้อมูลให้ครบถ้วน')),
      );
      return;
    }

    final quantity = int.tryParse(_quantityController.text);
    if (quantity == null || quantity <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('กรุณากรอกจำนวนที่เบิกให้ถูกต้อง')),
      );
      return;
    }

    final availableStock = _productDetails[_selectedProduct!]?['stock'] ?? 0;
    if (quantity > availableStock) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('จำนวนสินค้าในคลังไม่เพียงพอ')),
      );
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('เบิกสินค้าเรียบร้อย')),
    );

    setState(() {
      _productDetails[_selectedProduct!]?['stock'] =
          ((availableStock - quantity) >= 0 ? (availableStock - quantity) : 0);
    });
  }

  void _onCancel() {
    Navigator.pop(context);
  }
}

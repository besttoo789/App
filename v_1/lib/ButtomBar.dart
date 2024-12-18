import 'package:flutter/material.dart';

class Buttombar extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        theme: ThemeData.light(useMaterial3: false).copyWith(
          iconTheme: IconThemeData(color: Colors.white),
        ),
        home: ButtomBar(),
      );
}

class ButtomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: Text('Bottom AppBar')),
        body: Center(child: Text('Content here')),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _showMenu(context);
          },
          child: Icon(Icons.more_vert, color: Colors.white),
          backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        bottomNavigationBar: BottomAppBar(
          color: Colors.green,
          shape: CircularNotchedRectangle(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.home),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.shopping_cart),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.person),
              ),
            ],
          ),
        ),
      );

  void _showMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: Icon(Icons.qr_code_scanner),
                title: Text('Scan QR Code'),
                onTap: () {
                  Navigator.pop(context);
                  // Code to scan QR
                },
              ),
              ListTile(
                leading: Icon(Icons.camera_alt),
                title: Text('Add Photo'),
                onTap: () {
                  Navigator.pop(context);
                  // Code to capture photo
                },
              ),
            ],
          ),
        );
      },
    );
  }
}

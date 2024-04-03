import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:leadconnectpro/services/ocr_services.dart';
import '../colors.dart';
import 'package:leadconnectpro/Widgets/widgets.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _ocrService = OCRService();
  String _extractedText = '';
  final _picker = ImagePicker();
  int _currentIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  Future<void> _scanImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      String text = await _ocrService.extractTextFromImage(image);
      setState(() {
        _extractedText = text;
      });
    }
  }
  void dispose() {
    _ocrService.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primary,
        centerTitle: true,
        title: Text(''),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.notifications,
              color: secondary,
              size: 35.0,
            ),
            onPressed: () {
              // Handle notification icon press
            },
          ),
        ],
        iconTheme: IconThemeData(color: secondary, size: 35.0),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            ListTile(
              title: Text('Item 1'),
              onTap: () {
                // Handle item 1 tap
              },
            ),
            ListTile(
              title: Text('Item 2'),
              onTap: () {
                // Handle item 2 tap
              },
            ),
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Column(
              children: <Widget>[
                GestureDetector(
                  onTap: _scanImage,
                  child: Container(
                    child: Column(
                      children: [
                        Icon(
                          Icons.camera_alt_rounded,
                          color: icongrey,
                          size: 150.0,
                        ),
                        Text(
                          'Scan Your Card',
                          style: TextStyle(
                              fontSize: 24.0,
                              color: icongrey,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: MyBottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

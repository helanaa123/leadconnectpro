import 'package:flutter/material.dart';
import '../colors.dart';
import 'package:leadconnectpro/Widgets/widgets.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  void _onCameraIconPressed() {
    // Handle camera icon press
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
                  onTap: _onCameraIconPressed,
                  child: Icon(
                    Icons.camera_alt_rounded,
                    color: icongrey,
                    size: 150.0,
                  ),
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
        ],
      ),
      bottomNavigationBar: MyBottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

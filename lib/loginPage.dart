import 'package:flutter/material.dart';
import 'package:leadconnectpro/signupPage.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isPasswordVisible = false;

  void _togglePasswordVisibility() {
    setState(() {
      _isPasswordVisible = !_isPasswordVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          centerTitle: true,
          title: Text(
            'Login',
            style: TextStyle(color: Colors.white,
              fontWeight: FontWeight.bold,),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                SizedBox(height: 40.0),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 20.0),
                TextField(
                  obscureText: !_isPasswordVisible,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                    suffixIcon: IconButton(
                      icon: Icon(_isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off),
                      onPressed: _togglePasswordVisibility,
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                GestureDetector(
                  onTap: () {
                    // Handle forgot password
                  },
                  child: Text(
                    'Forgot Password?',
                    style: TextStyle(
                      color: Colors.blue,
                    ),
                  ),
                ),
                SizedBox(height: 50.0),
                ElevatedButton(
                  onPressed: () {
                    // Handle login
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        Colors.blueAccent, // Change the button's background color
                    padding: EdgeInsets.symmetric(
                        vertical: 15.0,
                        horizontal: 50.0), // Change the button's padding
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          40.0), // Change the button's border radius
                    ),
                  ),
                  child: Text(
                    'Login',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                    ),
                  ),
                ),
                SizedBox(height: 80.0),
                Text(
                  'Or login with',
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
                SizedBox(height: 30.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        // Handle Google login
                      },
                      child: Image.asset(
                        'assets/google.png',
                        width: 30.0,
                        height: 30.0,
                      ),
                    ),
                    SizedBox(width: 20.0),
                    InkWell(
                      onTap: () {
                        // Handle Facebook login
                      },
                      child: Image.asset(
                        'assets/facebook.png',
                        width: 30.0,
                        height: 30.0,
                      ),
                    ),
                    SizedBox(width: 20.0),
                    InkWell(
                      onTap: () {
                        // Handle LinkedIn login
                      },
                      child: Image.asset(
                        'assets/linkedin.png',
                        width: 30.0,
                        height: 30.0,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 130.0),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignUpPage()),
                    );
                  },
                  child: Text(
                    'New around here ? Sign up',
                    style: TextStyle(
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

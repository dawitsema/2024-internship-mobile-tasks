import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_6/features/user/presentation/pages/loginPage.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Timer to navigate to the next screen after 3 seconds
    Future.delayed(Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (_) => Loginpage(),
        ), // Replace with your home screen
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Image.asset(
              'assets/images/background.png', // Replace with your image path
              fit: BoxFit.cover,
            ),
          ),
          // Transparent blue overlay
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color.fromRGBO(63, 81, 243, 1).withOpacity(0.7),
                    Color.fromRGBO(63, 81, 243, 1).withOpacity(1),
                  ],
                ),
              ),
            ),
          ),

          // Logo and app name
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    'ECOM',
                    style: GoogleFonts.caveatBrush(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(63, 81, 243, 1),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'ECOMMERCE APP',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

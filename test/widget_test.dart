import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Choco App',
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Poppins', // Global font setting
      ),
      home: const FirstpageWidget(),
    );
  }
}

class FirstpageWidget extends StatelessWidget {
  // Fixed: Added the named 'key' parameter and 'const' constructor
  const FirstpageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // Figma Flutter Generator FirstpageWidget - FRAME
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          width: 375,
          height: 812,
          clipBehavior: Clip.hardEdge,
          decoration: const BoxDecoration(
            color: Color.fromRGBO(255, 255, 255, 1),
          ),
          child: Stack(
            children: <Widget>[
              // LOG IN BUTTON
              Positioned(
                top: 450,
                left: 68,
                child: _buildFigmaButton('Log in', 88),
              ),
              
              // SIGN UP BUTTON
              Positioned(
                top: 515,
                left: 68,
                child: _buildFigmaButton('Sign Up', 79),
              ),

              // SOCIAL ICONS ROW
              Positioned(
                top: 580,
                left: 106,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    _buildImage('assets/images/Google.png', 32, 32),
                    const SizedBox(width: 30),
                    _buildImage('assets/images/Microsoft.png', 33, 33),
                    const SizedBox(width: 30),
                    _buildImage('assets/images/Applelogo.png', 38, 46),
                  ],
                ),
              ),

              // FOOTER TEXT
              const Positioned(
                top: 772,
                left: 69,
                child: Text(
                  'Indulge with Chocolate',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Color.fromRGBO(0, 0, 0, 1),
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                    height: 1,
                  ),
                ),
              ),

              // TOP LOGO
              Positioned(
                top: 106,
                left: 138,
                child: _buildImage('assets/images/Sugarcube.png', 100, 100),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper: Builds the gray buttons exactly like your Figma export
  Widget _buildFigmaButton(String label, double textLeftPadding) {
    return Container(
      width: 240,
      height: 43,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color.fromRGBO(217, 217, 217, 1),
      ),
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 5,
            left: textLeftPadding,
            child: Text(
              label,
              style: const TextStyle(
                color: Color.fromRGBO(0, 0, 0, 1),
                fontSize: 22,
                fontWeight: FontWeight.normal,
                height: 1,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Helper: Handles images and prevents app crash if files are missing
  Widget _buildImage(String path, double width, double height) {
    return Image.asset(
      path,
      width: width,
      height: height,
      fit: BoxFit.contain,
      errorBuilder: (context, error, stackTrace) {
        // This shows a small gray box if the image hasn't been added to assets yet
        return Container(
          width: width,
          height: height,
          color: Colors.grey[200],
          child: const Icon(Icons.image_outlined, size: 16, color: Colors.grey),
        );
      },
    );
  }
}

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
        // This ensures your Poppins font is applied if you have it in pubspec
        fontFamily: 'Poppins', 
      ),
      home: const FirstpageWidget(),
    );
  }
}

class FirstpageWidget extends StatelessWidget {
  const FirstpageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SizedBox.expand(
          child: Stack(
            children: <Widget>[
              // 1. Logo Section
              Positioned(
                top: 80,
                left: 0,
                right: 0,
                child: Center(
                  child: _buildImage('assets/images/Sugarcube.png', 100, 100),
                ),
              ),

              // 2. Buttons Section (Navigation Logic Included)
              Positioned(
                bottom: 180,
                left: 0,
                right: 0,
                child: Column(
                  children: [
                    _buildFigmaButton(
                      context,
                      'Log in',
                      () {
                        debugPrint("Navigating to Second Page...");
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SecondPage(),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 20),
                    _buildFigmaButton(
                      context,
                      'Sign Up',
                      () => debugPrint("Sign Up Tapped"),
                    ),
                  ],
                ),
              ),

              // 3. Social Icons Row
              Positioned(
                bottom: 110,
                left: 0,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    _buildImage('assets/images/Google.png', 32, 32),
                    const SizedBox(width: 30),
                    _buildImage('assets/images/Microsoft.png', 33, 33),
                    const SizedBox(width: 30),
                    _buildImage('assets/images/Applelogo.png', 38, 46),
                  ],
                ),
              ),

              // 4. Footer Text
              const Positioned(
                bottom: 40,
                left: 0,
                right: 0,
                child: Text(
                  'Indulge with Chocolate',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper method for the Gray Figma Buttons
  Widget _buildFigmaButton(
      BuildContext context, String label, VoidCallback onTap) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          width: 240,
          height: 45,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color(0xFFD9D9D9),
          ),
          child: Center(
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 22,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Helper method for handling images safely
  Widget _buildImage(String path, double w, double h) {
    return Image.asset(
      path,
      width: w,
      height: h,
      fit: BoxFit.contain,
      // If the image is missing from your assets folder, show an icon instead
      errorBuilder: (context, error, stackTrace) => Icon(
        Icons.image_outlined,
        size: w,
        color: Colors.grey,
      ),
    );
  }
}

// The New Page to navigate to
class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Screen"),
        backgroundColor: const Color(0xFFD9D9D9),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.check_circle_outline, size: 80, color: Colors.green),
            SizedBox(height: 20),
            Text(
              "Login Successful!",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              "Welcome to the Chocolate App",
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
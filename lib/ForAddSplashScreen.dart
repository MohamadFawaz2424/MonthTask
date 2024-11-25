import 'package:ex_month/main.dart';
import 'package:flutter/material.dart';

class ForSplashScreen extends StatelessWidget {
  const ForSplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(), // استدعاء كلاس SplashScreen
    );
  }
}

// كلاس SplashScreen
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MyHomePage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: NetworkImage(
                'https://d2ms8rpfqc4h24.cloudfront.net/What_is_Flutter_f648a606af.png'),
            fit: BoxFit.cover),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.home, size: 120, color: Colors.white), // أيقونة الشعار
            SizedBox(height: 20),
            Text(
              'Welcome to ForSplashScreen \n Loding Home Page',
              style: TextStyle(fontSize: 24, color: Colors.white), // نص الترحيب
            ),
          ],
        ),
      ),
    );
  }
}

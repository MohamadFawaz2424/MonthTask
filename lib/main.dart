/*
بالنسبة للتاسك الشهري 
من ضمن التطبيق الشهري 
الsliver appbar
اضافة صورة من المعرض
اضافة وقت
اضافة تاريخ
slider
range slider
splash screen
page view

هي الأفكار اللي لازم تتطبق بالتاسك 
و انتو احرار بالشكل و العناصر الباقية 

هاد التاسك بدي إياه الساعة 12:00 يوم السبت غير قابل للتمديد
git clone                                           
 */

import 'package:ex_month/ForAddImage.dart';
import 'package:ex_month/ForAddDateTime.dart';
import 'package:ex_month/ForAddRangeSlider.dart';
import 'package:ex_month/ForAddSplashScreen.dart';
import 'package:ex_month/ForSlider.dart';
import 'package:ex_month/ForSiver.dart';
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
      home: ForSplashScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key});
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // final sizeScreen = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Monthly Task'),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            //Image(image: NetworkImage(url)),
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Main page ',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),

            ListTile(
              title: Text('Image Page '),
              onTap: () {
                Navigator.pop(context);

                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const ForImage()));
              },
            ),
            ListTile(
              title: Text('For Time'),
              onTap: () {
                Navigator.pop(context);

                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ForTime()));
              },
            ),
            ListTile(
              title: Text('Slider'),
              onTap: () {
                Navigator.pop(context);

                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const sliderWidget()));
              },
            ),
            ListTile(
              title: Text('For Range Slider'),
              onTap: () {
                Navigator.pop(context);

                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ForRangeSlider()));
              },
            ),
            ListTile(
              title: Text('For Silver AppBar'),
              onTap: () {
                Navigator.pop(context);

                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ForSilver()));
              },
            ),
          ],
        ),
      ),
      body: PageView(
        scrollDirection: Axis.horizontal,
        children: [
          Container(
            color: Colors.blueAccent,
            child: Center(
              child: Text(
                'Willcome To:',
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
            ),
          ),
          Container(
            color: Colors.greenAccent,
            child: Center(
              child: Text(
                'In The Monthly Project',
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
            ),
          ),
          Container(
            color: Colors.blueAccent,
            child: Center(
              child: Text(
                'Created By Mohamad Fawaz',
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

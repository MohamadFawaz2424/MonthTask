import 'package:ex_month/main.dart';
import 'package:flutter/material.dart';

class ForSilver extends StatefulWidget {
  @override
  State<ForSilver> createState() => _ForSilverState();
}

class _ForSilverState extends State<ForSilver> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Silver AppBar Page ',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: Text('Main page '),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => MyHomePage()),
                );
              },
            ),
          ],
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200.0,
            floating: true,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                "Silver AppBar Example",
                style:
                    TextStyle(color: const Color.fromARGB(255, 187, 33, 243)),
              ),
              background: Image.network(
                'https://d2ms8rpfqc4h24.cloudfront.net/What_is_Flutter_f648a606af.png', 
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return ListTile(
                  title: Text('Item #$index'),
                );
              },
              childCount: 50,
            ),
          ),
        ],
      ),
    );
  }
}

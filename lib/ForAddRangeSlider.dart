import 'package:ex_month/main.dart';
import 'package:flutter/material.dart';

class ForRangeSlider extends StatelessWidget {
  const ForRangeSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RangeSliderExample(),
    );
  }
}

class RangeSliderExample extends StatefulWidget {
  @override
  State<RangeSliderExample> createState() => _RangeSliderExampleState();
}

class _RangeSliderExampleState extends State<RangeSliderExample> {
  RangeValues _currentRangeValues = RangeValues(20, 80);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Monthly Task')),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Range Slider Page ',
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Salary Between: ${_currentRangeValues.start.toStringAsFixed(1)}\$   And   ${_currentRangeValues.end.toStringAsFixed(1)}\$',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 35),
            RangeSlider(
              values: _currentRangeValues,
              min: 0,
              max: 100,
              divisions: 20,
              labels: RangeLabels(
                _currentRangeValues.start.toStringAsFixed(1),
                _currentRangeValues.end.toStringAsFixed(1),
              ),
              activeColor: Colors.green[400],
              onChanged: (RangeValues values) {
                setState(() {
                  _currentRangeValues = values;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

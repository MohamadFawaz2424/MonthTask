import 'package:ex_month/main.dart';
import 'package:flutter/material.dart';

class sliderWidget extends StatelessWidget {
  const sliderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ForSlider(),
    );
  }
}

class ForSlider extends StatefulWidget {
  ForSlider({super.key});

  @override
  State<ForSlider> createState() => _ForSliderState();
}

class _ForSliderState extends State<ForSlider> {
  double _sliderValue = 50.0;
  Color _colorChangeState = Colors.blue;
  final colorSwatched = ColorSwatch(
    0xFFFFFFFF, // اللون الأساسي: أخضر
    {
      0: Color(0xFFFF0000),
      30: Color(0xFFFFFFFF),
      80: Color(0xFF000000),
      100: Color(0xFFFFFFFF),
    },
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Monthly Task'),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Text(
                  'Slider page ',
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
              AnimatedContainer(
                duration: Duration(seconds: 2),
                curve: Curves.easeInOut,
                width: _sliderValue * 4,
                height: _sliderValue * 4,
                color: _colorChangeState,
                child: Center(
                    child: Text(
                  'Hello',
                  style: TextStyle(color: colorSwatched[_sliderValue.toInt()]),
                )),
              ),
              Text(
                'Value: ${_sliderValue.toStringAsFixed(1)}',
                style: TextStyle(fontSize: 20),
              ),
              Slider(
                value: _sliderValue,
                min: 0,
                max: 100,
                divisions: 30,
                label: _sliderValue.toStringAsFixed(1),
                activeColor: _colorChangeState,

                //activeColor: Colors.red,
                onChanged: (value) {
                  setState(() {
                    value < 30
                        ? _colorChangeState = Colors.red
                        : value < 75
                            ? _colorChangeState = Colors.blue
                            : _colorChangeState = Colors.green;
                    _sliderValue = value;
                  });
                },
              ),
            ],
          ),
        ));
  }
}

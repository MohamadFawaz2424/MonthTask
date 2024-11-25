import 'package:ex_month/main.dart';

import 'package:flutter/material.dart';

class ForTime extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TimePickerHomePage(),
    );
  }
}

class TimePickerHomePage extends StatelessWidget {
  final FormKey = GlobalKey<FormState>();

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
                'Date page ',
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
        child: Form(
          key: FormKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const TimePickerField(
                labelText: 'Choose Start Time',
              ),
              SizedBox(height: 16),
              TimePickerField(
                labelText: 'Choose End Time',
                initialTime:
                    "${DateTime.now().hour.toString()} : ${DateTime.now().minute.toString()}",
              ),
              SizedBox(height: 20),
              InputDatePickerFormField(
                  fieldHintText: "month/day/year",
                  initialDate: DateTime.now(),
                  keyboardType: TextInputType.text,
                  autofocus: false,
                  firstDate: DateTime(2001),
                  lastDate: DateTime(2025)),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (FormKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Form Submitted')),
                    );
                  }
                },
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TimePickerField extends StatefulWidget {
  final String labelText;
  final IconData prefixIcon;
  final Function(TimeOfDay?)? onTimeSelected;
  final String? initialTime;

  const TimePickerField({
    Key? key,
    this.labelText = 'Select Time',
    this.prefixIcon = Icons.access_time,
    this.onTimeSelected,
    this.initialTime,
  }) : super(key: key);

  @override
  _TimePickerFieldState createState() => _TimePickerFieldState();
}

class _TimePickerFieldState extends State<TimePickerField> {
  TimeOfDay? _selectedTime;
  late TextEditingController _timeController;

  @override
  void initState() {
    super.initState();
    _timeController = TextEditingController(
      text: widget.initialTime ?? '', // وقت مبدئي إذا وُجد
    );
  }

  @override
  void dispose() {
    _timeController.dispose();
    super.dispose();
  }

  Future<void> _pickTime(BuildContext context) async {
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: _selectedTime ?? TimeOfDay.now(),
    );

    if (pickedTime != null) {
      setState(() {
        _selectedTime = pickedTime;
        _timeController.text = pickedTime.format(context); // تحديث النص
      });

      if (widget.onTimeSelected != null) {
        widget.onTimeSelected!(pickedTime);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _timeController,
      readOnly: true,
      decoration: InputDecoration(
        labelText: widget.labelText,
        hintText: 'Tap to pick a time',
        prefixIcon: Icon(widget.prefixIcon),
        border: OutlineInputBorder(),
      ),
      onTap: () => _pickTime(context),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please select a time';
        }
        return null;
      },
    );
  }
}

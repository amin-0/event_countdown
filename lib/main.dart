// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:ui';
import 'pick_date.dart';
import 'pick_time.dart';
import 'package:flutter/material.dart';
import 'countdown_logic.dart';
import 'dart:async';
import 'package:countdown/widgets/display_widget.dart';
// import 'package:countdown/widgets/selector_widget.dart';

void main() =>
    runApp(MaterialApp(debugShowCheckedModeBanner: false, home: CountDown()));

// ignore: use_key_in_widget_constructors
class CountDown extends StatefulWidget {
  @override
  State<CountDown> createState() => _CountDownState();
}

class _CountDownState extends State<CountDown> {
  late Timer timer;
  late DateTime selectedDate;
  TimeOfDay selectedTime = TimeOfDay(hour: 00, minute: 00);
  bool start = false;
  String eventName = ' ';

//write a function that control the timing
  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        countDown(selectedDate, selectedTime);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text(
            'Event CountDown',
            style: TextStyle(fontSize: 20.0),
          ),
          centerTitle: false,
          backgroundColor: Colors.blue,
        ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Event Name',
                        style: TextStyle(fontSize: 20.0),
                      ),
                      SizedBox(height: 10),
                      TextField(
                          onChanged: (value) {
                            eventName = value;
                          },
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                              ),
                              hintText: 'Enter name of the event'),
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.w400),
                          readOnly: start ? true : false)
                    ]),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  PickDateWidget(onDateSelected: (newDate) {
                    setState(() {
                      selectedDate = newDate;
                    });
                  }),
                  PickTimeWidget(
                    onTimeSelected: (newTime) {
                      setState(() {
                        selectedTime = newTime;
                      });
                    },
                  ),
                ],
              ),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      if (eventName == ' ') {
                        String text = 'Add an event name';
                        showErrorDialog(text, context);
                      } else {
                        startTimer();
                        start = true;
                      }
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                    child: Text(
                      'START',
                      style: TextStyle(
                        fontSize: 40,
                      ),
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                      textStyle: TextStyle(fontSize: 30.0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)))),
              Text(
                'This event begins in',
                style: const TextStyle(fontSize: 20.0),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  DisplayWidget(
                      child: start ? daysLeft.toString() : 'D', label: 'Days'),
                  DisplayWidget(
                      child: start ? hoursLeft.toString() : 'H',
                      label: 'Hours'),
                  DisplayWidget(
                      child: start ? minsLeft.toString() : 'M', label: 'Mins'),
                  DisplayWidget(
                      child: start ? secondsLeft.toString() : 'S',
                      label: 'Sec'),
                ],
              ),
            ],
          ),
        ));
  }
}

Future<void> showErrorDialog(String text, context) async {
  return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          content: SingleChildScrollView(child: Text(text)),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                // start = false;
              },
              child: Text('Okay'),
            )
          ],
        );
      });
}

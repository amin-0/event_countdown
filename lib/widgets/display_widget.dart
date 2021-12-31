// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class DisplayWidget extends StatelessWidget {
  final String child;
  final String label;
  const DisplayWidget({Key? key, required this.child, required this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        OutlinedButton(
            onPressed: null,
            child: Text(
              child,
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w900),
            ),
            style: OutlinedButton.styleFrom(
                textStyle: TextStyle(fontSize: 20.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                fixedSize: Size(70, 50),
                side: BorderSide(width: 2.0, color: Color(0xff808080)))),
        SizedBox(
          height: 10,
        ),
        Text(
          label,
          style: TextStyle(fontSize: 20),
        )
      ],
    );
  }
}

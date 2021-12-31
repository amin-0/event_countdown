// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';

class SelectorWidget extends StatelessWidget {
  final String title;
  final String data;
  final VoidCallback onClicked;

  const SelectorWidget(
      {Key? key,
      required this.title,
      required this.data,
      required this.onClicked})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          title,
          style: TextStyle(fontSize: 20.0),
        ),
        SizedBox(
          height: 5,
        ),
        ElevatedButton(
            onPressed: onClicked,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
              child: Text(
                data,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)))),
      ],
    );
  }
}

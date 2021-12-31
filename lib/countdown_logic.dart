import 'dart:async';

import 'package:flutter/material.dart';

late Timer timer;

int count = 100;
DateTime now = DateTime.now();
// DateTime future = DateTime.utc(2021, 12, 25);

int daysLeft = 0;
int hoursLeft = 0;
int minsLeft = 0;
int secondsLeft = 0;

void countDown(DateTime futureDate, TimeOfDay time) {
  DateTime now = DateTime.now();
  DateTime eventDate = DateTime(futureDate.year, futureDate.month,
      futureDate.day, time.hour, time.minute);
  Duration difference = eventDate.difference(now);

  difference = difference - const Duration(seconds: 1);
  daysLeft = difference.inDays;
  hoursLeft = difference.inHours - (daysLeft * 24);
  minsLeft = difference.inMinutes - (daysLeft * 24 * 60) - (hoursLeft * 60);
  secondsLeft = difference.inSeconds -
      (daysLeft * 24 * 60 * 60) -
      (hoursLeft * 60 * 60) -
      (minsLeft * 60);
}

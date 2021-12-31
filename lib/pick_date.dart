import 'package:flutter/material.dart';
import 'package:countdown/widgets/selector_widget.dart';

class PickDateWidget extends StatefulWidget {
  final Function(DateTime)? onDateSelected;
  const PickDateWidget({Key? key, this.onDateSelected}) : super(key: key);

  @override
  State<PickDateWidget> createState() => _PickDateWidgetState();
}

class _PickDateWidgetState extends State<PickDateWidget> {
  DateTime date = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return SelectorWidget(
        title: 'Date',
        data: getDate(),
        onClicked: () {
          pickDate(context);
        });
  }

  Future pickDate(BuildContext context) async {
    final newDate = await showDatePicker(
      context: context,
      initialDate: date,
      firstDate: DateTime(2021),
      lastDate: DateTime(2030),
    );
    if (newDate == null) return;

    // date = newDate; // i want to pass this new date to the START button above
    if (widget.onDateSelected != null) {
      widget.onDateSelected!(newDate);
    }
    setState(() {
      date = newDate;
    });
  }

  String getDate() {
    if (date.isBefore(DateTime.now())) {
      return '00/00/0000';
    } else {
      return '${date.day}/${date.month}/${date.year}';
    }
  }
}

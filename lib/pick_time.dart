import 'package:flutter/material.dart';
import 'package:countdown/widgets/selector_widget.dart';

class PickTimeWidget extends StatefulWidget {
  final Function(TimeOfDay)? onTimeSelected;
  const PickTimeWidget({
    this.onTimeSelected,
    Key? key,
  }) : super(key: key);

  @override
  State<PickTimeWidget> createState() => _PickTimeWidgetState();
}

class _PickTimeWidgetState extends State<PickTimeWidget> {
  TimeOfDay time = const TimeOfDay(hour: 00, minute: 00);
  String getText() {
    final hours = time.hour.toString().padLeft(2, '0');
    final minutes = time.minute.toString().padLeft(2, '0');
    return '$hours:$minutes';
  }

  @override
  Widget build(BuildContext context) {
    return SelectorWidget(
      title: 'Time',
      data: getText(),
      onClicked: () => pickTime(context),
    );
  }

  Future pickTime(BuildContext context) async {
    final newTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (newTime == null) return;

    time = newTime;

    if (widget.onTimeSelected != null) {
      widget.onTimeSelected!(newTime);
    }

    setState(() {});
  }
}

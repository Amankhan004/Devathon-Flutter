import 'package:flutter/material.dart';

class AppointmentTime extends StatefulWidget {
  const AppointmentTime({super.key, required this.text});

  final String text;

  @override
  State<AppointmentTime> createState() => _AppointmentTimeState();
}

class _AppointmentTimeState extends State<AppointmentTime> {
  bool ispress = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          ispress = !ispress;
        });
      },
      child: Container(
        height: 40,
        width: 55,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color:ispress? Colors.purple:Colors.black, width: 0.75)),
        child:  Center(child: Text(widget.text)),
      ),
    );
  }
}

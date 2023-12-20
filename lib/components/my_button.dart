import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  const MyButton({super.key, this.ontap, required this.text});
  final Function()? ontap;
  final String? text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(color: Colors.blue, offset: Offset(0, 8), blurRadius: 5)
            ],
            color: const Color(0xFFB28CFF),
            borderRadius: BorderRadius.circular(10)),
        width: double.infinity,
        child: Center(
          child: Text(
            text ?? "",
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
          ),
        ),
      ),
    );
  }
}

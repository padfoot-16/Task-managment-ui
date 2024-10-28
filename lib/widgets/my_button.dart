import 'package:flutter/material.dart';

class MyBuotton extends StatelessWidget {
  final void Function()? onTap;
  final Color? color;
  final String text;
  const MyBuotton({super.key, required this.onTap, required this.text,required this.color});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration:  BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color:color),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 20
              ),
          ),
        ),
      ),
    );
  }
}
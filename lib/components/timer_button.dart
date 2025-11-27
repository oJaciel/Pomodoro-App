import 'package:flutter/material.dart';

class TimerButton extends StatelessWidget {
  const TimerButton({super.key, required this.text, required this.icon});

  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: Colors.black,
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        textStyle: TextStyle(fontSize: 25),
      ),
      child: Row(children: [Padding(
        padding: const EdgeInsets.only(right: 10),
        child: Icon(icon, size: 35),
      ), Text(text)]),
    );
  }
}

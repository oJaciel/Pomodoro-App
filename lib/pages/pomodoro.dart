import 'package:flutter/material.dart';
import 'package:pomodoro/components/time_enter.dart';
import 'package:pomodoro/components/timer.dart';

class Pomodoro extends StatelessWidget {
  const Pomodoro({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(child: Timer()),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TimeEnter(title: 'Trabalho', value: 25),
                TimeEnter(title: 'Descanso', value: 5),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

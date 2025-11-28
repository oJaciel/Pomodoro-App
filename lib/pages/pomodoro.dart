import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pomodoro/components/time_enter.dart';
import 'package:pomodoro/components/timer.dart';
import 'package:pomodoro/store/pomodoro.store.dart';
import 'package:provider/provider.dart';

class Pomodoro extends StatelessWidget {
  const Pomodoro({super.key});

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<PomodoroStore>(context);

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(child: Timer()),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 40),
            child: Observer(
              builder: (_) => Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TimeEnter(
                    title: 'Trabalho',
                    value: store.workTime,
                    dec: store.started && store.isWorking()
                        ? null
                        : store.decreaseWorkTime,
                    inc: store.started && store.isWorking()
                        ? null
                        : store.incrementWorkTime,
                  ),
                  TimeEnter(
                    title: 'Descanso',
                    value: store.restTime,
                    dec: store.started && store.isResting()
                        ? null
                        : store.decreaseRestTime,
                    inc: store.started && store.isResting()
                        ? null
                        : store.incrementRestTime,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

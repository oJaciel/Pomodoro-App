import 'dart:async';

import 'package:mobx/mobx.dart';

part 'pomodoro.store.g.dart';

class PomodoroStore = _PomodoroStore with _$PomodoroStore;

enum TimeType { WORK, REST }

abstract class _PomodoroStore with Store {
  @observable
  bool started = false;

  @observable
  int minutes = 2;

  @observable
  int seconds = 0;

  @observable
  int workTime = 2;

  @observable
  int restTime = 1;

  @observable
  TimeType timeType = TimeType.WORK;

  Timer? timer;

  @action
  void init() {
    started = true;
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (minutes == 0 && seconds == 0) {
        _changeTimeType();
      } else if (seconds == 0) {
        seconds = 59;
        minutes--;
      } else {
        seconds--;
      }
    });
  }

  @action
  void stop() {
    started = false;
    timer?.cancel();
  }

  @action
  void restart() {
    stop();
    minutes = isWorking() ? workTime : restTime;
    seconds = 0;
  }

  @action
  void incrementWorkTime() {
    workTime++;
    if (isWorking()) {
      restart();
    }
  }

  @action
  void decreaseWorkTime() {
    if (workTime - 1 < 0) return;
    workTime--;
    if (isWorking()) {
      restart();
    }
  }

  @action
  void incrementRestTime() {
    restTime++;
    if (isResting()) {
      restart();
    }
  }

  @action
  void decreaseRestTime() {
    if (restTime - 1 < 0) return;
    restTime--;
    if (isResting()) {
      restart();
    }
  }

  bool isWorking() {
    return timeType == TimeType.WORK;
  }

  bool isResting() {
    return timeType == TimeType.REST;
  }

  void _changeTimeType() {
    if (isWorking()) {
      timeType = TimeType.REST;
      minutes = restTime;
    } else {
      timeType = TimeType.WORK;
      minutes = workTime;
    }
    seconds = 0;
  }
}

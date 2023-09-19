import 'dart:async';

import 'package:countdown_app/homepage/domain/entity/countdown.dart';
import 'package:countdown_app/homepage/infra/countdown_repository.dart';
import 'package:flutter/material.dart';

class CountdownController extends ChangeNotifier {
  final CountdownRepository _countdownRepository;

  CountdownController({
    required CountdownRepository countdownRepository,
  }) : _countdownRepository = countdownRepository {
    start();
  }

  Stream<void> stream() async* {
    do {
      await Future.delayed(const Duration(seconds: 1));
      yield null;
    } while (true);
  }

  List<Countdown> countdowns = [];

  void addCountdown(Countdown countdown) {
    countdowns.add(countdown);
    countdowns.sort((a, b) => a.date.compareTo(b.date));
    notifyListeners();
    save();
  }

  void removeCountdown(Countdown countdown) {
    countdowns.remove(countdown);
    countdowns.sort((a, b) => a.date.compareTo(b.date));
    notifyListeners();
    save();
  }

  void start() async {
    final countdowns = await _countdownRepository.getCountdowns();
    this.countdowns = countdowns;
    notifyListeners();
  }

  Future<void> save() => _countdownRepository.saveCountdowns(countdowns);
}

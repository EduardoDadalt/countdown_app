import 'package:countdown_app/homepage/domain/entity/countdown.dart';
import 'package:countdown_app/homepage/infra/countdown_repository.dart';
import 'package:flutter/material.dart';

class CountdownController extends ChangeNotifier {
  final CountdownRepository _countdownRepository;

  CountdownController({
    required CountdownRepository countdownRepository,
  }) : _countdownRepository = countdownRepository;

  List<Countdown> countdowns = [];

  void addCountdown(Countdown countdown) {
    countdowns.add(countdown);
    notifyListeners();
  }

  void removeCountdown(Countdown countdown) {
    countdowns.remove(countdown);
    notifyListeners();
  }

  void start() async {
    final countdowns = await _countdownRepository.getCountdowns();
    this.countdowns = countdowns;
    notifyListeners();
  }
}

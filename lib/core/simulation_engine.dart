import 'dart:async';
import 'package:flutter/material.dart';
import 'threat.dart';

class SimulationEngine extends ChangeNotifier {
  final List<Threat> threats = [];
  int _nextId = 0;
  Timer? _timer;

  /// Start automatic simulation
  void start() {
    _timer ??= Timer.periodic(
      const Duration(seconds: 2),
      (_) => tick(),
    );
  }

  /// Button: Add threat
  void spawnThreat() {
    threats.add(
      Threat(
        id: _nextId++,
        severity: 4 + (_nextId % 6),
        deadline: 10 + _nextId,
      ),
    );
    notifyListeners();
  }

  /// Button: Advance time
  void tick() {
    for (final threat in threats) {
      if (!threat.resolved) {
        threat.resolve();
        break;
      }
    }
    notifyListeners();
  }

  /// Button: Resolve top threat manually
  void resolveTopThreat() {
    for (final threat in threats) {
      if (!threat.resolved) {
        threat.resolve();
        notifyListeners();
        return;
      }
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}

/*
PROJECT TITLE: Sentinel – Real-Time Threat Simulation

AUTHOR: Anshika Jain

PROJECT OVERVIEW:
This application simulates a real-time threat monitoring system.
Threats are generated dynamically with varying severity and deadlines.

CORE CONCEPTS USED:
- Simulation-based state updates
- Priority-based scheduling logic
- Human-in-the-loop decision making
- Time-driven system evolution

WORKING:
1. New threats are injected into the system.
2. Each threat has a severity and deadline.
3. A priority score determines criticality.
4. User actions influence system outcome.

REAL-WORLD INSPIRATION:
The project is inspired by systems used in:
- Cybersecurity dashboards
- Emergency response centers
- Defense monitoring systems

WHY THIS PROJECT IS ADVANCED:
This is not a static game.
It models a dynamic system where decisions affect outcomes over time.
*/

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/simulation_engine.dart';
import 'screens/dashboard_screen.dart';

void main() {
  runApp(const SentinelApp());
}

class SentinelApp extends StatelessWidget {
  const SentinelApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) {
        final engine = SimulationEngine();
        engine.start();
        return engine;
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Sentinel',
        theme: ThemeData.dark(),
        home: DashboardScreen(), // ✅ NOT const
      ),
    );
  }
}


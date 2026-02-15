/*
  SENTINEL – DASHBOARD SCREEN
  ----------------------------
  Author: Anshika Jain

  This screen represents the control panel of the Sentinel simulation system.

  BUTTON FUNCTIONS:
  -----------------
  ➕ Add Threat
     - Injects a new simulated threat into the system.
     - Each threat has a unique ID, severity, and deadline.
     - The threat initially appears as ACTIVE.

  ⏱ Advance Time
     - Simulates one logical time step in the system.
     - Automatically resolves the highest-priority active threat.
     - Represents system-driven autonomous response.

  ✅ Resolve
     - Manually resolves the most critical active threat.
     - Demonstrates user-driven intervention in the simulation.

  ℹ Info Button
     - Displays application information and author credit.
     - Shows: App name, version, and "Made by Anshika Jain".

  The dashboard dynamically updates using Provider state management
  whenever the simulation engine changes.
*/

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../core/simulation_engine.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final engine = context.watch<SimulationEngine>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Sentinel Dashboard'),
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline),
            onPressed: () {
              showAboutDialog(
                context: context,
                applicationName: 'Sentinel',
                applicationVersion: '1.0.0',
                applicationLegalese: 'Made by Anshika Jain',
              );
            },
          ),
        ],
      ),

      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(12),
              children: engine.threats.map((t) {
                return Card(
                  child: ListTile(
                    title: Text('Threat #${t.id}'),
                    subtitle: Text(
                      'Severity: ${t.severity} | Deadline: ${t.deadline}',
                    ),
                    trailing: Text(
                      t.resolved ? 'RESOLVED' : 'ACTIVE',
                      style: TextStyle(
                        color: t.resolved ? Colors.green : Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),

          const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Text(
              'Made by Anshika Jain',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),

      // 🔥 BUTTONS
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton.extended(
            heroTag: 'add',
            icon: const Icon(Icons.add),
            label: const Text('Add Threat'),
            onPressed: engine.spawnThreat,
          ),
          const SizedBox(height: 10),
          FloatingActionButton.extended(
            heroTag: 'tick',
            icon: const Icon(Icons.timer),
            label: const Text('Advance Time'),
            onPressed: engine.tick,
          ),
          const SizedBox(height: 10),
          FloatingActionButton.extended(
            heroTag: 'resolve',
            icon: const Icon(Icons.check),
            label: const Text('Resolve'),
            onPressed: engine.resolveTopThreat,
          ),
        ],
      ),
    );
  }
}

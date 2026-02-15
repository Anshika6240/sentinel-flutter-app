import 'package:flutter/material.dart';
import '../core/threat.dart';

class ThreatCard extends StatelessWidget {
  final Threat threat;

  const ThreatCard({super.key, required this.threat});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text('Threat #${threat.id}'),
        subtitle: Text(
          'Severity: ${threat.severity} | Deadline: ${threat.timeToDeadline}\nState: ${threat.state.name}',
        ),
      ),
    );
  }
}

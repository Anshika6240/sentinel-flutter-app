import 'threat.dart';

class Scheduler {
  List<Threat> prioritize(List<Threat> threats) {
    threats.sort((a, b) => b.priorityScore.compareTo(a.priorityScore));
    return threats;
  }
}

class Threat {
  final int id;
  final int severity;
  final int deadline;
  bool resolved;

  Threat({
    required this.id,
    required this.severity,
    required this.deadline,
    this.resolved = false,
  });

  void resolve() {
    resolved = true;
  }
}

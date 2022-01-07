class Launcher {
  final String id;
  Launcher({required this.id});

  factory Launcher.fromJson(Map<String, dynamic> json) {
    return Launcher(id: json['id']);
  }
}

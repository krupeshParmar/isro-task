class CustomerSatellite {
  final String id, country, launch_date, mass, launcher;

  CustomerSatellite(
      {required this.id,
      required this.country,
      required this.launch_date,
      required this.mass,
      required this.launcher});

  factory CustomerSatellite.fromJson(Map<String, dynamic> json) {
    return CustomerSatellite(
        id: json['id'],
        country: json['country'],
        launch_date: json['launch_date'],
        mass: json['mass'],
        launcher: json['launcher']);
  }
}

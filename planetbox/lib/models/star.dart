class Star {
  final int id;
  final String altitude;
  final String content;
  final String direction;
  final String enName;
  final String jpName;
  final String origin;
  final String roughly;
  final String season;
  final String starIcon;
  final String starImage;

  Star({
    required this.id,
    required this.altitude,
    required this.content,
    required this.direction,
    required this.enName,
    required this.jpName,
    required this.origin,
    required this.roughly,
    required this.season,
    required this.starIcon,
    required this.starImage,
  });

  factory Star.fromJson(Map<String, dynamic> json) {
    return Star(
      id: int.parse(json['id']),
      altitude: json['altitude'],
      content: json['content'],
      direction: json['direction'],
      enName: json['enName'],
      jpName: json['jpName'],
      origin: json['origin'],
      roughly: json['roughly'],
      season: json['season'],
      starIcon: json['starIcon'],
      starImage: json['starImage'],
    );
  }
}

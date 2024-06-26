class Pokemon {
  final int id;
  final String pokemon;
  final String type;
  final List<String> abilities;
  final int hitpoints;
  final List<String> evolutions;
  final String location;
  final String imageUrl;

  Pokemon({
    required this.id,
    required this.pokemon,
    required this.type,
    required this.abilities,
    required this.hitpoints,
    required this.evolutions,
    required this.location,
    required this.imageUrl,
  });

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return Pokemon(
      id: json['id'],
      pokemon: json['pokemon'],
      type: json['type'],
      abilities: List<String>.from(json['abilities']),
      hitpoints: json['hitpoints'],
      evolutions: List<String>.from(json['evolutions']),
      location: json['location'],
      imageUrl: json['image_url'],
    );
  }
}

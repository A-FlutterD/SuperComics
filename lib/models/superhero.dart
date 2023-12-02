class Results {
  List<Superhero> superheroes;

  Results({required this.superheroes});

  factory Results.fromJson(Map<String, dynamic> json) {
    return Results(
      superheroes: List<Superhero>.from(json['results'].map((x) => Superhero.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() {
    return {
    'results': List<dynamic>.from(superheroes.map((x) => x.toJson())),
    };
  }

}


class Superhero {
  String id;
  String name;
  String gender;
  String intelligence;
  String image;
  

  Superhero({
    required this.id,
    required this.name,
    required this.image,
    required this.gender,
    required this.intelligence
  });

  factory Superhero.fromJson(Map<String, dynamic> json) => Superhero(
    id : json['id'],
    name : json['name'],
    image : json['image']['url'],
    gender: json['appearance']['gender'],
    intelligence: json['powerstats']['intelligence']
  );

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'gender': gender,
      'intelligence': intelligence,
    };
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'gender': gender,
      'intelligence': intelligence,
    };
  }

  Superhero.fromMap(Map<String, dynamic> map)
      : name = map['name'],
        id = map['id'],
        image = map['image'],
        gender = map['gender'],
        intelligence = map['intelligence'];


}

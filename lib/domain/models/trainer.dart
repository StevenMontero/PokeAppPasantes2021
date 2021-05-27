import 'package:poke_app/domain/models/pokemon.dart';

class TrainerPokemon {
  late final String name;
  late final String lastName;
  late final String region;
  late final String email;
  late final List<Pokemon> pokemonsList;
  TrainerPokemon(
      {this.region = '',
      this.email = '',
      required this.name,
      required this.lastName,
      required this.pokemonsList});

  TrainerPokemon.fromJson(Map<String, dynamic> json) {
    this.name = json['name'];
    this.lastName = json['lastName'];
    this.region = json['region'] ?? '';
    this.email = json['email'] ?? '';
    this.pokemonsList = List<Pokemon>.from(json['pokemonsList']
        .map((model) => Pokemon.fromJsonFirebase(json: model)));
  }
  Map<String, dynamic> toJson() {
    return {
      'name': this.name,
      'lastName': this.lastName,
      'region': this.region,
      'email': this.email,
      'pokemonsList':
          List<dynamic>.from(this.pokemonsList.map((x) => x.toJson()))
    };
  }
}

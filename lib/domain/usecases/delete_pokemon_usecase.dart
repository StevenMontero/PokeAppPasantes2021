import 'package:poke_app/data/production/pokemon_collection_firebase.dart';
import 'package:poke_app/domain/models/pokemon.dart';

class DeletePokemonUseCase {
  final CapturedPokemonsRepository _pokemonRepository =
      new CapturedPokemonsRepository();
  void deletePokemon(Pokemon pokemon) async {
    _pokemonRepository.deletePokemon(pokemon);
  }

  void deletePokemonList(List<Pokemon> pokemon) async {
    pokemon.forEach((element) => _pokemonRepository.deletePokemon(element));
  }
}

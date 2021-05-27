import 'package:poke_app/data/production/pokemon_collection_firebase.dart';
import 'package:poke_app/domain/models/pokemon.dart';

class CapturedPokemonUseCase{
  final CapturedPokemonsRepository _capturedPokemonsRepository = new CapturedPokemonsRepository();

  void capturedPokemon(Pokemon pokemon){
    _capturedPokemonsRepository.addNewPokemon(pokemon);
  }
}
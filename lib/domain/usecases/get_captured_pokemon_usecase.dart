import 'package:poke_app/data/production/poke_api.dart';
import 'package:poke_app/data/production/pokemon_collection_firebase.dart';
import 'package:poke_app/domain/models/pokemon.dart';

class GetCapturedPokemonUseCase {
  final CapturedPokemonsRepository _capturedPokemonsRepository =
      new CapturedPokemonsRepository();

  Future<List<Pokemon>> getCapturedPokemon() {
    return _capturedPokemonsRepository.getListCapturedPokemons();
  }
}

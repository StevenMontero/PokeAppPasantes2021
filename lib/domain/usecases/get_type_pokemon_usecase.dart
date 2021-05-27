import 'package:poke_app/data/production/poke_api.dart';
import 'package:poke_app/domain/models/pokemon.dart';

class GetDetailPokemonUseCase {
  final PokeApi _pokeApi = new PokeApi();

  Future<Pokemon> capturedPokemonType(Pokemon pokemon) {
    return _pokeApi.getPokemonDetail(pokemon);
  }
}

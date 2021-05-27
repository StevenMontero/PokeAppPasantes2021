import 'package:poke_app/data/production/poke_api.dart';
import 'package:poke_app/domain/models/pokemon.dart';

class LoadPokemonPokeApiUseCase{
  PokeApi _pokeApi = new PokeApi();
  Future<List<Pokemon>> getPokemonsList(int limit, int offset) async {
    return _pokeApi.getPokemonsList(limit, offset);
  }
}
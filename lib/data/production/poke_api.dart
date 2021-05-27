import 'package:dio/dio.dart';
import 'package:poke_app/domain/models/pokemon.dart';

class PokeApi {
  var dio = Dio();

  Future<List<Pokemon>> getPokemonsList(int limit, int offset) async {
    List<Pokemon> _pokemonList = [];
    int _idCount = 1;
    final response = await dio
        .get('https://pokeapi.co/api/v2/pokemon?limit=$limit&offset=$offset');
    for (var item in response.data['results']) {
      final urlImage =
          'https://pokeres.bastionbot.org/images/pokemon/$_idCount.png';
      _pokemonList.add(Pokemon.fromJsonPokeApi(
          json: item, apiVersion: 'V2', urlImageApi: urlImage));
      _idCount++;
    }
    return _pokemonList;
  }

  Future<Pokemon> getPokemonDetail(Pokemon pokemon) async {
    final response = await dio.get(pokemon.urlDetail);
    String firstSlot = '';
    String seconSlot = '';
    for (var item in response.data['types']) {
      if (item['slot'] == 1)
        firstSlot = item['type']['name'];
      else
        seconSlot = item['type']['name'];
    }
    return Pokemon(
        name: pokemon.name,
        urlDetail: pokemon.urlDetail,
        urlImage: pokemon.urlImage,
        firstSlot: firstSlot,
        secondSlot: seconSlot);
  }
}

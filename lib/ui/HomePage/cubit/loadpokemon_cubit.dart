import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:poke_app/domain/models/pokemon.dart';
import 'package:poke_app/domain/usecases/captured_pokemon.dart';
import 'package:poke_app/domain/usecases/delete_pokemon_usecase.dart';
import 'package:poke_app/domain/usecases/get_type_pokemon_usecase.dart';
import 'package:poke_app/domain/usecases/load_pokemons__usecase.dart';

part 'loadpokemon_state.dart';

class PokemonCubit extends Cubit<PokemonState> {
  LoadPokemonPokeApiUseCase useCaseLoadPokemon =
      new LoadPokemonPokeApiUseCase();
  CapturedPokemonUseCase _capturedPokemonUseCase = new CapturedPokemonUseCase();
  DeletePokemonUseCase _deletePokemonUseCase = new DeletePokemonUseCase();
  GetDetailPokemonUseCase _detailPokemonUseCase = new GetDetailPokemonUseCase();
  PokemonCubit() : super(PokemonState());

  void loadPokemon(int limit, int offset) async {
    emit(state.copyWith(state: StateLoadApi.loading));
    final _listPokemon =
        await useCaseLoadPokemon.getPokemonsList(limit, offset);
    emit(
        state.copyWith(listPokemons: _listPokemon, state: StateLoadApi.loaded));
  }

  void capturedPokemon(Pokemon pokemon) async {
    emit(state.copyWith(statePokemon: StatePokemon.loading));
    final _pokemonWithType =
        await _detailPokemonUseCase.capturedPokemonType(pokemon);
    _capturedPokemonUseCase.capturedPokemon(_pokemonWithType);
    emit(state.copyWith(statePokemon: StatePokemon.loaded));
  }

  void deletePokemon(Pokemon pokemon) {
    _deletePokemonUseCase.deletePokemon(pokemon);
  }
}

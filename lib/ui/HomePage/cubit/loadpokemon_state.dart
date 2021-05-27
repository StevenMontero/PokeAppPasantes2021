part of 'loadpokemon_cubit.dart';

enum StateLoadApi { pure, loading, loaded }
enum StatePokemon { pure, loading, loaded }

class PokemonState extends Equatable {
  const PokemonState(
      {this.listPokemons = const [],
      this.state = StateLoadApi.pure,
      this.statePokemon = StatePokemon.pure});
  final List<Pokemon> listPokemons;
  final StateLoadApi state;
  final StatePokemon statePokemon;

  PokemonState copyWith(
      {List<Pokemon>? listPokemons,
      StateLoadApi? state,
      StatePokemon? statePokemon}) {
    return PokemonState(
      listPokemons: listPokemons ?? this.listPokemons,
      state: state ?? this.state,
      statePokemon: statePokemon ?? this.statePokemon,
    );
  }

  @override
  List<Object> get props => [listPokemons, state, statePokemon];
}

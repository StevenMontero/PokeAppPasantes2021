part of 'trainercubit_cubit.dart';


class TrainerState extends Equatable {
  const TrainerState(
      {this.indexTrainerSelected = -1, this.trainersPokemon = const []});
  final List<TrainerPokemon> trainersPokemon;
  final int indexTrainerSelected;

  TrainerPokemon get trainerSlected => trainersPokemon[indexTrainerSelected];

  TrainerState copyWith(
      {List<TrainerPokemon>? trainersPokemon, int? indexTrainerSelected}) {
    return TrainerState(
        trainersPokemon: trainersPokemon ?? this.trainersPokemon,
        indexTrainerSelected:
            indexTrainerSelected ?? this.indexTrainerSelected);
  }

  @override
  List<Object> get props => [trainersPokemon, indexTrainerSelected];
}

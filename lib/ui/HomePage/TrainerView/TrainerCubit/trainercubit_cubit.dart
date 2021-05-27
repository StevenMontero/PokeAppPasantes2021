import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/rendering.dart';
import 'package:poke_app/domain/models/pokemon.dart';
import 'package:poke_app/domain/models/trainer.dart';
import 'package:poke_app/domain/usecases/add_trainer_usecase.dart';
import 'package:poke_app/domain/usecases/delete_trainer_usecase.dart';
import 'package:poke_app/domain/usecases/edit_trainer__usecase.dart';
import 'package:poke_app/domain/usecases/load_trainers_usecase.dart';

part 'trainercubit_state.dart';

class TrainerCubit extends Cubit<TrainerState> {
  TrainerCubit() : super(TrainerState());
  final EditTrainerUseCase _editTrainerUseCase = new EditTrainerUseCase();
  final DeleteTrainerUseCase _deleteTrainerUseCase = new DeleteTrainerUseCase();
  final LoadTrainersUseCase _loadTrainersUseCase = new LoadTrainersUseCase();
  final AddTrainerUseCase _addTrainerUseCase = new AddTrainerUseCase();

  void selectedTrainer(int index) {
    emit(state.copyWith(indexTrainerSelected: index));
  }

  void deleteTrainer(int index) {
    _deleteTrainerUseCase.deleteTrainer(state.trainersPokemon[index]);
    final _list = List<TrainerPokemon>.from(state.trainersPokemon)
      ..removeAt(index);
    emit(state.copyWith(trainersPokemon: _list));
  }

  void updateTrainer(
      {required String name,
      required String lastName,
      String email = '',
      String region = '',
      required List pokemonsList}) {
    final _trainer = TrainerPokemon(
        name: name,
        lastName: lastName,
        email: email,
        region: region,
        pokemonsList: List<Pokemon>.from(pokemonsList));

    _editTrainerUseCase.updateTrainer(_trainer);
    final _list = List<TrainerPokemon>.from(state.trainersPokemon)
      ..removeAt(state.indexTrainerSelected)
      ..add(_trainer);

    emit(state.copyWith(trainersPokemon: _list, indexTrainerSelected: -1));
  }

  void loadAllTrainers() async {
    final _list = await _loadTrainersUseCase.getListTrainerPokemon();
    emit(state.copyWith(trainersPokemon: _list));
  }

  void unSelect() async {
    emit(state.copyWith(indexTrainerSelected: -1));
  }

  void addTrainer(
      {required String name,
      required String lastName,
      String email = '',
      String region = '',
      required List pokemonsList}) {
    final _trainer = TrainerPokemon(
        name: name,
        lastName: lastName,
        email: email,
        region: region,
        pokemonsList: List<Pokemon>.from(pokemonsList));

    _addTrainerUseCase.addNewTrainer(_trainer);
    final _list = List<TrainerPokemon>.from(state.trainersPokemon)
      ..add(_trainer);

    emit(state.copyWith(trainersPokemon: _list));
  }
}

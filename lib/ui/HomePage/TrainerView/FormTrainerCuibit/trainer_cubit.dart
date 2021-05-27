import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:poke_app/domain/models/pokemon.dart';
import 'package:poke_app/domain/models/trainer.dart';

import 'package:poke_app/utils/regularExpressions/email.dart';
import 'package:poke_app/utils/regularExpressions/noEmptyList.dart';
import 'package:poke_app/utils/regularExpressions/text_validator.dart';

part 'trainer_state.dart';

class TrainerFormCubit extends Cubit<TrainerFormState> {
  TrainerFormCubit() : super(const TrainerFormState());

  void emailChanged(String value) {
    final email = Email.dirty(value);
    emit(state.copyWith(
      email: email,
      status: _validatorParamsForm(
          name: state.name,
          lastName: state.lastName,
          email: email,
          region: state.region,
          listPokemons: state.listPokemons),
    ));
  }

  void regionChanged(String value) {
    final region = TextValidator.dirty(value);
    emit(state.copyWith(
      region: region,
      status: _validatorParamsForm(
          name: state.name,
          lastName: state.lastName,
          email: state.email,
          region: region,
          listPokemons: state.listPokemons),
    ));
  }

  void nameChanged(String value) {
    final name = TextValidator.dirty(value);

    emit(state.copyWith(
      name: name,
      status: _validatorParamsForm(
          name: name,
          lastName: state.lastName,
          email: state.email,
          region: state.region,
          listPokemons: state.listPokemons),
    ));
  }

  void lastNameChanged(String value) {
    final lastName = TextValidator.dirty(value);
    emit(state.copyWith(
      lastName: lastName,
      status: _validatorParamsForm(
          name: state.name,
          lastName: lastName,
          email: state.email,
          region: state.region,
          listPokemons: state.listPokemons),
    ));
  }

  void listPokemonChanged(Pokemon value) {
    final cloneList = List.from(state.listPokemons.value)..add(value);
    final listPokemons = ListValidator.dirty(cloneList);
    emit(state.copyWith(
      listPokemons: listPokemons,
      status: _validatorParamsForm(
          name: state.name,
          lastName: state.lastName,
          email: state.email,
          region: state.region,
          listPokemons: listPokemons),
    ));
  }

  void loadTrainerDataToUpdate(TrainerPokemon value) {
    final listPokemons = emit(state.copyWith(
      listPokemons: ListValidator.dirty(value.pokemonsList),
      name: TextValidator.dirty(value.name),
      lastName: TextValidator.dirty(value.lastName),
      email: Email.dirty(value.email),
      region: TextValidator.dirty(value.region),
      status: _validatorParamsForm(
          name: state.name,
          lastName: state.lastName,
          email: state.email,
          region: state.region,
          listPokemons: ListValidator.dirty(value.pokemonsList)),
    ));
  }

  void removelistPokemon(Pokemon value) {
    final cloneList = List.from(state.listPokemons.value)..remove(value);
    final listPokemons = ListValidator.dirty(cloneList);
    emit(state.copyWith(
      listPokemons: listPokemons,
      status: _validatorParamsForm(
          name: state.name,
          lastName: state.lastName,
          email: state.email,
          region: state.region,
          listPokemons: listPokemons),
    ));
  }

  bool containtPokemon(Pokemon pokemon) {
    return state.listPokemons.value.contains(pokemon.name);
  }

  FormzStatus _validatorParamsForm(
      {required TextValidator name,
      required TextValidator lastName,
      required Email email,
      required TextValidator region,
      required ListValidator listPokemons}) {
    if (email.value != '' && region.value != '') {
      return Formz.validate([name, lastName, email, region, listPokemons]);
    } else if (email.value != '') {
      return Formz.validate([name, lastName, email, listPokemons]);
    } else if (region.value != '') {
      return Formz.validate([name, lastName, region, listPokemons]);
    } else {
      return Formz.validate([name, lastName, listPokemons]);
    }
  }
}

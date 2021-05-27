import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:poke_app/domain/models/pokemon.dart';
import 'package:poke_app/domain/usecases/get_captured_pokemon_usecase.dart';
import 'package:poke_app/ui/HomePage/TrainerView/FormTrainerCuibit/trainer_cubit.dart';
import 'package:poke_app/ui/HomePage/TrainerView/PagetrainercontrollerCubit/pagetrainercontroller_cubit.dart';
import 'package:poke_app/ui/HomePage/TrainerView/TrainerCubit/trainercubit_cubit.dart';
import 'package:poke_app/ui/Shared/avatar_widget.dart';
import 'package:poke_app/ui/Shared/custom_imput_decoration.dart';
import 'package:poke_app/ui/Shared/custom_outlined_button.dart';

class TrainerFormPage extends StatelessWidget {
  const TrainerFormPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TrainerFormCubit(),
      child: Body(),
    );
  }
}

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _trainerCubit = context.watch<TrainerCubit>().state;
    final _capturedPokemon = GetCapturedPokemonUseCase();
    if (_trainerCubit.indexTrainerSelected >= 0)
      context
          .read<TrainerFormCubit>()
          .loadTrainerDataToUpdate(_trainerCubit.trainerSlected);
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.only(top: 50),
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 370),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AvatarCustom(),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Formulario',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.15),
                ),
                SizedBox(height: 20),
                // Name
                BlocBuilder<TrainerFormCubit, TrainerFormState>(
                  buildWhen: (previous, current) =>
                      previous.name != current.name,
                  builder: (context, state) {
                    return TextFormField(
                      initialValue: _trainerCubit.indexTrainerSelected >= 0
                          ? _trainerCubit.trainerSlected.name
                          : null,
                      onChanged: (value) =>
                          context.read<TrainerFormCubit>().nameChanged(value),
                      style: TextStyle(color: Colors.black),
                      decoration: CustomInputs.loginInputDecoration(
                          hint: 'Ash',
                          label: 'Nombre*',
                          errorMessage: 'Nombre invalido',
                          errorOcurred: state.name.invalid,
                          icon: Icons.person_rounded),
                    );
                  },
                ),

                SizedBox(height: 20),
                // LastName
                BlocBuilder<TrainerFormCubit, TrainerFormState>(
                  buildWhen: (previous, current) =>
                      previous.lastName != current.lastName,
                  builder: (context, state) {
                    return TextFormField(
                      initialValue: _trainerCubit.indexTrainerSelected >= 0
                          ? _trainerCubit.trainerSlected.lastName
                          : null,
                      onChanged: (value) => context
                          .read<TrainerFormCubit>()
                          .lastNameChanged(value),
                      style: TextStyle(color: Colors.black),
                      decoration: CustomInputs.loginInputDecoration(
                          hint: 'Ketchum',
                          label: 'Apellidos*',
                          errorMessage: 'Apellido invalido',
                          errorOcurred: state.lastName.invalid,
                          icon: Icons.person_rounded),
                    );
                  },
                ),

                SizedBox(height: 20),
                // Email
                BlocBuilder<TrainerFormCubit, TrainerFormState>(
                  buildWhen: (previous, current) =>
                      previous.email != current.email,
                  builder: (context, state) {
                    final trainerEmail = _trainerCubit.indexTrainerSelected >= 0
                        ? _trainerCubit.trainerSlected.email
                        : '';
                    return TextFormField(
                      initialValue: _trainerCubit.indexTrainerSelected >= 0
                          ? trainerEmail.isEmpty
                              ? null
                              : trainerEmail
                          : null,
                      onChanged: (value) =>
                          context.read<TrainerFormCubit>().emailChanged(value),
                      style: TextStyle(color: Colors.black),
                      decoration: CustomInputs.loginInputDecoration(
                          hint: 'ash@pokemail.com',
                          label: 'Ingrese su correo (Opcional)',
                          errorMessage: 'Email invalido',
                          errorOcurred: state.email.value == ""
                              ? false
                              : state.email.invalid,
                          icon: Icons.email_outlined),
                    );
                  },
                ),

                SizedBox(height: 20),

                BlocBuilder<TrainerFormCubit, TrainerFormState>(
                  buildWhen: (previous, current) =>
                      previous.region != current.region,
                  builder: (context, state) {
                    final trainerRegion =
                        _trainerCubit.indexTrainerSelected >= 0
                            ? _trainerCubit.trainerSlected.region
                            : '';
                    return TextFormField(
                      initialValue: _trainerCubit.indexTrainerSelected >= 0
                          ? trainerRegion.isEmpty
                              ? null
                              : trainerRegion
                          : null,
                      onChanged: (value) =>
                          context.read<TrainerFormCubit>().regionChanged(value),
                      style: TextStyle(color: Colors.black),
                      decoration: CustomInputs.loginInputDecoration(
                          hint: 'Kanto',
                          label: 'Región (Opcional)',
                          errorMessage: 'Región invalido',
                          errorOcurred: state.region.value == ""
                              ? false
                              : state.region.invalid,
                          icon: Icons.landscape_sharp),
                    );
                  },
                ),
                SizedBox(height: 20),

                _trainerCubit.indexTrainerSelected < 0
                    ? Text(
                        'Pokemons disponibles:*',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 0.1),
                      )
                    : Text('Pokemons del entrenador:*',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 0.1)),

                SizedBox(height: 10),
                _trainerCubit.indexTrainerSelected < 0
                    ? FutureBuilder(
                        future: _capturedPokemon.getCapturedPokemon(),
                        builder:
                            (context, AsyncSnapshot<List<Pokemon>> snapshot) {
                          if (snapshot.hasData) {
                            return BlocBuilder<TrainerFormCubit,
                                TrainerFormState>(
                              builder: (context, state) {
                                return Wrap(
                                  alignment: WrapAlignment.center,
                                  children: List<Widget>.generate(
                                      snapshot.data!.length,
                                      (index) => Padding(
                                            padding: const EdgeInsets.all(4.0),
                                            child: FilterChip(
                                              backgroundColor: Colors.blue[50],
                                              avatar: CircleAvatar(
                                                backgroundImage: NetworkImage(
                                                    snapshot
                                                        .data![index].urlImage),
                                              ),
                                              selectedColor: Colors.blue[300],
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(10))),
                                              selected: state.listPokemons.value
                                                  .contains(
                                                      snapshot.data![index]),
                                              label: Text(
                                                  snapshot.data![index].name),
                                              onSelected: (value) {
                                                if (value) {
                                                  context
                                                      .read<TrainerFormCubit>()
                                                      .listPokemonChanged(
                                                          snapshot
                                                              .data![index]);
                                                } else {
                                                  context
                                                      .read<TrainerFormCubit>()
                                                      .removelistPokemon(
                                                          snapshot
                                                              .data![index]);
                                                }
                                              },
                                            ),
                                          )),
                                );
                              },
                            );
                          } else {
                            return CircularProgressIndicator();
                          }
                        },
                      )
                    : BlocBuilder<TrainerFormCubit, TrainerFormState>(
                        builder: (context, state) {
                          final _listPokemons =
                              _trainerCubit.trainerSlected.pokemonsList;
                          ;
                          return Wrap(
                              alignment: WrapAlignment.center,
                              children: List<Widget>.generate(
                                  _listPokemons.length,
                                  (index) => Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: FilterChip(
                                        backgroundColor: Colors.blue[50],
                                        avatar: CircleAvatar(
                                          backgroundImage: NetworkImage(
                                              _listPokemons[index].urlImage),
                                        ),
                                        selectedColor: Colors.blue[300],
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10))),
                                        selected: state.listPokemons.value
                                            .contains(_listPokemons[index]),
                                        label: Text(_listPokemons[index].name),
                                        onSelected: (value) {
                                          if (value) {
                                            context
                                                .read<TrainerFormCubit>()
                                                .listPokemonChanged(
                                                    _listPokemons[index]);
                                          } else {
                                            context
                                                .read<TrainerFormCubit>()
                                                .removelistPokemon(state
                                                    .listPokemons.value[index]);
                                          }
                                        },
                                      ))));
                        },
                      ),

                SizedBox(height: 20),
                Builder(
                  builder: (context) {
                    final _formCubit = context.watch<TrainerFormCubit>().state;
                    final _trainerCubit = context.watch<TrainerCubit>().state;
                    return _formCubit.status == FormzStatus.valid
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CustomOutlinedButton(
                                onPressed: () {
                                  context
                                      .read<PagetrainercontrollerCubit>()
                                      .bodyChanged('trainers');
                                  context.read<TrainerCubit>().unSelect();
                                },
                                text: 'Volver',
                              ),
                              CustomOutlinedButton(
                                onPressed: () {
                                  if (_trainerCubit.indexTrainerSelected < 0) {
                                    context.read<TrainerCubit>().addTrainer(
                                        name: _formCubit.name.value,
                                        lastName: _formCubit.lastName.value,
                                        email: _formCubit.email.value,
                                        region: _formCubit.region.value,
                                        pokemonsList:
                                            _formCubit.listPokemons.value);
                                  } else {
                                    context.read<TrainerCubit>().updateTrainer(
                                        name: _formCubit.name.value,
                                        lastName: _formCubit.lastName.value,
                                        email: _formCubit.email.value,
                                        region: _formCubit.region.value,
                                        pokemonsList:
                                            _formCubit.listPokemons.value);
                                  }
                                  context
                                      .read<PagetrainercontrollerCubit>()
                                      .bodyChanged('trainers');
                                },
                                text: _trainerCubit.indexTrainerSelected < 0
                                    ? 'Agregar'
                                    : 'Guardar',
                              ),
                            ],
                          )
                        : CustomOutlinedButton(
                            onPressed: () {
                              context
                                  .read<PagetrainercontrollerCubit>()
                                  .bodyChanged('trainers');
                              context.read<TrainerCubit>().unSelect();
                            },
                            text: 'Volver',
                          );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

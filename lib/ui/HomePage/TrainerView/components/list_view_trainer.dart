import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poke_app/ui/HomePage/TrainerView/PagetrainercontrollerCubit/pagetrainercontroller_cubit.dart';
import 'package:poke_app/ui/HomePage/TrainerView/TrainerCubit/trainercubit_cubit.dart';
import 'package:poke_app/ui/Responsive/ResponsiveApp.dart';
import 'package:poke_app/ui/Shared/PokeCard/trainer_card.dart';

class TrainerListViewPage extends StatelessWidget {
  const TrainerListViewPage() : super();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TrainerCubit, TrainerState>(builder: (context, state) {
      return Scaffold(
        floatingActionButton: FloatingActionButton.extended(
          backgroundColor: Colors.blue[400],
          foregroundColor: Colors.black,
          onPressed: () =>
              context.read<PagetrainercontrollerCubit>().bodyChanged('form'),
          icon: Icon(Icons.add),
          label: Text('AGREGAR'),
        ),
        body: GridView.count(
          crossAxisCount: Responsive.isMobile(context)
              ? 2
              : Responsive.isDesktop(context)
                  ? 5
                  : 3,
          children: List.generate(state.trainersPokemon.length, (index) {
            return WhiteCardTrainer(
              title: state.trainersPokemon[index].name +
                  ' ' +
                  state.trainersPokemon[index].lastName +
                  '\nPokemons: ${state.trainersPokemon[index].pokemonsList.length}',
              onPressDelete: () =>
                  context.read<TrainerCubit>().deleteTrainer(index),
              onPressEdit: () => {
                context.read<TrainerCubit>().selectedTrainer(index),
                context.read<PagetrainercontrollerCubit>().bodyChanged('form')
              },
            );
          }),
        ),
      );
    });
  }
}

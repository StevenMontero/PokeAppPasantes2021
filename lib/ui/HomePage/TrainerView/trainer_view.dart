import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:poke_app/ui/HomePage/TrainerView/PagetrainercontrollerCubit/pagetrainercontroller_cubit.dart';
import 'TrainerCubit/trainercubit_cubit.dart';


class TrainerPage extends StatefulWidget {
  const TrainerPage() : super();

  @override
  _TrainerPageState createState() => _TrainerPageState();
}

class _TrainerPageState extends State<TrainerPage> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(
        create: (context) => PagetrainercontrollerCubit(),
      ),
      BlocProvider(
        create: (context) => TrainerCubit()..loadAllTrainers(),
      )
    ], child: Body());
  }
}

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PagetrainercontrollerCubit, PagetrainercontrollerState>(
        buildWhen: (previous, current) => previous.body != current.body,
        builder: (context, state) => state.body);
  }
}

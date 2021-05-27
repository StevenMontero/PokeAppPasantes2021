import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:poke_app/ui/HomePage/TrainerView/components/form_trainer.dart';
import 'package:poke_app/ui/HomePage/TrainerView/components/list_view_trainer.dart';

part 'pagetrainercontroller_state.dart';

class PagetrainercontrollerCubit extends Cubit<PagetrainercontrollerState> {
  PagetrainercontrollerCubit()
      : super(PagetrainercontrollerState(body: TrainerListViewPage()));

  final Map<String, Widget> _bodyDirectory = {
    'trainers': TrainerListViewPage(),
    'form': TrainerFormPage(),
  };

  void bodyChanged(String boyKey) {
    emit(state.copyWith(
        body: _bodyDirectory.containsKey(boyKey)
            ? _bodyDirectory[boyKey]!
            : _bodyDirectory['trainers']!));
  }
}

import 'package:poke_app/data/production/trainers_collection_firebase.dart';
import 'package:poke_app/domain/models/trainer.dart';

class AddTrainerUseCase {
  final TrainerPokemonRepository _trainerPokemonRepository =
      new TrainerPokemonRepository();
  void addNewTrainer(TrainerPokemon trainer) async {
    _trainerPokemonRepository.addNewTrainer(trainer);
  }
}

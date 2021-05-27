import 'package:poke_app/data/production/trainers_collection_firebase.dart';
import 'package:poke_app/domain/models/trainer.dart';

class DeleteTrainerUseCase {
  final TrainerPokemonRepository _trainerPokemonRepository =
      new TrainerPokemonRepository();
  void deleteTrainer(TrainerPokemon trainer) async {
    _trainerPokemonRepository.deleteTrainer(trainer);
  }
}

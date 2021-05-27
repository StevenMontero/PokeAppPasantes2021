import 'package:poke_app/data/production/trainers_collection_firebase.dart';
import 'package:poke_app/domain/models/trainer.dart';

class EditTrainerUseCase {
  final TrainerPokemonRepository _trainerPokemonRepository =
      new TrainerPokemonRepository();

      void updateTrainer(TrainerPokemon trainer) async {
        return _trainerPokemonRepository.updateTrainer(trainer);
      }
}

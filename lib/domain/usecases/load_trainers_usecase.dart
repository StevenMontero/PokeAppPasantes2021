import 'package:poke_app/data/production/trainers_collection_firebase.dart';
import 'package:poke_app/domain/models/trainer.dart';

class LoadTrainersUseCase {
  final TrainerPokemonRepository _repoTrainer = new TrainerPokemonRepository();
  Future<List<TrainerPokemon>> getListTrainerPokemon() async {
    return _repoTrainer.getListTrainerPokemon();
  }
}

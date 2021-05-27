import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:poke_app/domain/models/trainer.dart';

class TrainerPokemonRepository {
  final CollectionReference _refCapturedPokemonsCollection =
      FirebaseFirestore.instance.collection('trainer');

  Future<List<TrainerPokemon>> getListTrainerPokemon() async {
    QuerySnapshot snapshot = await _refCapturedPokemonsCollection.get();

    return List<TrainerPokemon>.from(
        snapshot.docs.map((e) => TrainerPokemon.fromJson(e.data())));
  }

  void addNewTrainer(TrainerPokemon trainer) async {
    _refCapturedPokemonsCollection
        .doc(trainer.name + trainer.lastName)
        .set(trainer.toJson(), SetOptions(merge: true))
        .then((value) => print('Trainer Added'))
        .catchError((error) => print('Failed to add Trainer: $error'));
  }

  void deleteTrainer(TrainerPokemon trainer) async {
    _refCapturedPokemonsCollection
        .doc(trainer.name + trainer.lastName)
        .delete()
        .then((value) => print('Trainer Deleted'))
        .catchError((error) => print('Failed to delete Trainer: $error'));
  }
  void updateTrainer(TrainerPokemon trainer) async {
    _refCapturedPokemonsCollection
        .doc(trainer.name + trainer.lastName + '${DateTime.now()}')
        .update(trainer.toJson())
        .then((value) => print('Trainer Updated'))
        .catchError((error) => print('Failed to updated Trainer: $error'));
  }

  
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:poke_app/domain/models/pokemon.dart';

class CapturedPokemonsRepository {
  final CollectionReference _refCapturedPokemonsCollection =
      FirebaseFirestore.instance.collection('capturedPokemons');

  void addNewPokemon(Pokemon pokemon) async {
    _refCapturedPokemonsCollection
        .doc(pokemon.name + '${DateTime.now()}')
        .set(pokemon.toJson(), SetOptions(merge: true))
        .then((value) => print('Pokemon Added'))
        .catchError((error) => print('Failed to add pokemon: $error'));
  }

  void deletePokemon(Pokemon pokemon) async {
    _refCapturedPokemonsCollection
        .doc(pokemon.name + '${DateTime.now()}')
        .delete()
        .then((value) => print('Pokemon Deleted'))
        .catchError((error) => print('Failed to delete pokemon: $error'));
  }

  Future<List<Pokemon>> getListCapturedPokemons() async {
    QuerySnapshot snapshot = await _refCapturedPokemonsCollection.get();

    return List<Pokemon>.from(
        snapshot.docs.map((e) => Pokemon.fromJsonFirebase(json: e.data())));
  }
}

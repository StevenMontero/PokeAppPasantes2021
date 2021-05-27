part of 'trainer_cubit.dart';

class TrainerFormState extends Equatable {
  final Email email;
  final TextValidator name;
  final TextValidator lastName;
  final TextValidator region;
  final ListValidator listPokemons;
  final FormzStatus status;
  const TrainerFormState({
    this.region = const TextValidator.pure(),
    this.listPokemons = const ListValidator.dirty(),
    this.lastName = const TextValidator.pure(),
    this.email = const Email.pure(),
    this.name = const TextValidator.pure(),
    this.status = FormzStatus.pure,
  });

  TrainerFormState copyWith({
    Email? email,
    TextValidator? name,
    TextValidator? lastName,
    FormzStatus? status,
    TextValidator? region,
    ListValidator? listPokemons,

  }) {
    return TrainerFormState(
      email: email ?? this.email,
      name: name ?? this.name,
      lastName: lastName ?? this.lastName,
      region: region ?? this.region,
      listPokemons: listPokemons ?? this.listPokemons,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [email, name, status,lastName,region,listPokemons];
}

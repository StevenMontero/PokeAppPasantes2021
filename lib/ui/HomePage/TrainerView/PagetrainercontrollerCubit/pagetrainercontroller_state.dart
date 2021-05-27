part of 'pagetrainercontroller_cubit.dart';

class PagetrainercontrollerState extends Equatable {
  const PagetrainercontrollerState({required this.body});
  final Widget body;

  PagetrainercontrollerState copyWith({Widget? body}) {
    return PagetrainercontrollerState(body: body ?? this.body);
  }

  @override
  List<Object> get props => [body];
}

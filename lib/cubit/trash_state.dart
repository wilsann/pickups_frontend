part of 'trash_cubit.dart';

abstract class TrashState extends Equatable {
  const TrashState();

  @override
  List<Object> get props => [];
}

class TrashInitial extends TrashState {}

class TrashLoaded extends TrashState {
  final List<Trash> trash;

  TrashLoaded(this.trash);

  @override
  List<Object> get props => [trash];
}

class TrashLoadingFailed extends TrashState {
  final String message;

  TrashLoadingFailed(this.message);

  @override
  List<Object> get props => [message];
}

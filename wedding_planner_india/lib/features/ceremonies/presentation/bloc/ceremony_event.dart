part of 'ceremony_bloc.dart';

sealed class CeremonyEvent extends Equatable {
  const CeremonyEvent();

  @override
  List<Object?> get props => [];
}

class CeremonyLoadRequested extends CeremonyEvent {
  const CeremonyLoadRequested(this.weddingId);

  final String weddingId;

  @override
  List<Object?> get props => [weddingId];
}

class CeremonyUpdated extends CeremonyEvent {
  const CeremonyUpdated(this.ceremony);

  final CeremonyEntity ceremony;

  @override
  List<Object?> get props => [ceremony];
}

class CeremonyAdded extends CeremonyEvent {
  const CeremonyAdded({
    required this.weddingId,
    required this.name,
    required this.side,
  });

  final String weddingId;
  final String name;
  final CeremonySide side;

  @override
  List<Object?> get props => [weddingId, name, side];
}

class CeremonyDeleted extends CeremonyEvent {
  const CeremonyDeleted(this.ceremonyId);

  final String ceremonyId;

  @override
  List<Object?> get props => [ceremonyId];
}

class CeremonyReordered extends CeremonyEvent {
  const CeremonyReordered(this.ceremonies);

  final List<CeremonyEntity> ceremonies;

  @override
  List<Object?> get props => [ceremonies];
}

class ChecklistItemToggled extends CeremonyEvent {
  const ChecklistItemToggled({
    required this.ceremonyId,
    required this.itemId,
    required this.completed,
  });

  final String ceremonyId;
  final String itemId;
  final bool completed;

  @override
  List<Object?> get props => [ceremonyId, itemId, completed];
}

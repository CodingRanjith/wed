part of 'ceremony_bloc.dart';

enum CeremonyStatus { initial, loading, loaded, error }

class CeremonyState extends Equatable {
  const CeremonyState({
    this.status = CeremonyStatus.initial,
    this.ceremonies = const [],
    this.selectedCeremony,
  });

  final CeremonyStatus status;
  final List<CeremonyEntity> ceremonies;
  final CeremonyEntity? selectedCeremony;

  List<CeremonyEntity> get brideCeremonies => ceremonies
      .where((c) => c.side == CeremonySide.bride || c.side == CeremonySide.both)
      .toList();

  List<CeremonyEntity> get groomCeremonies => ceremonies
      .where((c) => c.side == CeremonySide.groom || c.side == CeremonySide.both)
      .toList();

  CeremonyState copyWith({
    CeremonyStatus? status,
    List<CeremonyEntity>? ceremonies,
    CeremonyEntity? selectedCeremony,
  }) {
    return CeremonyState(
      status: status ?? this.status,
      ceremonies: ceremonies ?? this.ceremonies,
      selectedCeremony: selectedCeremony ?? this.selectedCeremony,
    );
  }

  @override
  List<Object?> get props => [status, ceremonies, selectedCeremony];
}

part of 'guest_bloc.dart';

enum GuestStatus { initial, loading, loaded, error }

class GuestState extends Equatable {
  const GuestState({
    this.status = GuestStatus.initial,
    this.guests = const [],
  });

  final GuestStatus status;
  final List<GuestEntity> guests;

  int get comingCount =>
      guests.where((g) => g.rsvpStatus == RsvpStatus.coming).length;

  int get notComingCount =>
      guests.where((g) => g.rsvpStatus == RsvpStatus.notComing).length;

  GuestState copyWith({
    GuestStatus? status,
    List<GuestEntity>? guests,
  }) {
    return GuestState(
      status: status ?? this.status,
      guests: guests ?? this.guests,
    );
  }

  @override
  List<Object?> get props => [status, guests];
}

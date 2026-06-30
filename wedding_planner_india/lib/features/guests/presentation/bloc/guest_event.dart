part of 'guest_bloc.dart';

sealed class GuestEvent extends Equatable {
  const GuestEvent();

  @override
  List<Object?> get props => [];
}

class GuestLoadRequested extends GuestEvent {
  const GuestLoadRequested(this.weddingId);

  final String weddingId;

  @override
  List<Object?> get props => [weddingId];
}

class GuestAdded extends GuestEvent {
  const GuestAdded({
    required this.weddingId,
    required this.name,
    required this.side,
    this.phone = '',
    this.rsvpStatus = RsvpStatus.pending,
    this.foodPreference = FoodPreference.veg,
  });

  final String weddingId;
  final String name;
  final GuestSide side;
  final String phone;
  final RsvpStatus rsvpStatus;
  final FoodPreference foodPreference;

  @override
  List<Object?> get props => [
        weddingId,
        name,
        side,
        phone,
        rsvpStatus,
        foodPreference,
      ];
}

class GuestUpdated extends GuestEvent {
  const GuestUpdated(this.guest);

  final GuestEntity guest;

  @override
  List<Object?> get props => [guest];
}

class GuestDeleted extends GuestEvent {
  const GuestDeleted(this.guestId);

  final String guestId;

  @override
  List<Object?> get props => [guestId];
}

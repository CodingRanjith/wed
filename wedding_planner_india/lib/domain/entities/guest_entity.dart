import 'package:equatable/equatable.dart';
import 'package:wedding_planner_india/core/constants/app_constants.dart';

class GuestEntity extends Equatable {
  const GuestEntity({
    required this.id,
    required this.weddingId,
    required this.name,
    required this.side,
    this.phone = '',
    this.email = '',
    this.rsvpStatus = RsvpStatus.pending,
    this.foodPreference = FoodPreference.veg,
    this.invitationSent = false,
    this.roomAllocation = '',
    this.tableNumber = '',
    this.giftReceived = '',
    this.giftValue = 0,
    this.thankYouSent = false,
    this.notes = '',
  });

  final String id;
  final String weddingId;
  final String name;
  final GuestSide side;
  final String phone;
  final String email;
  final RsvpStatus rsvpStatus;
  final FoodPreference foodPreference;
  final bool invitationSent;
  final String roomAllocation;
  final String tableNumber;
  final String giftReceived;
  final double giftValue;
  final bool thankYouSent;
  final String notes;

  @override
  List<Object?> get props => [
        id,
        weddingId,
        name,
        side,
        phone,
        email,
        rsvpStatus,
        foodPreference,
        invitationSent,
        roomAllocation,
        tableNumber,
        giftReceived,
        giftValue,
        thankYouSent,
        notes,
      ];

  GuestEntity copyWith({
    String? id,
    String? weddingId,
    String? name,
    GuestSide? side,
    String? phone,
    String? email,
    RsvpStatus? rsvpStatus,
    FoodPreference? foodPreference,
    bool? invitationSent,
    String? roomAllocation,
    String? tableNumber,
    String? giftReceived,
    double? giftValue,
    bool? thankYouSent,
    String? notes,
  }) {
    return GuestEntity(
      id: id ?? this.id,
      weddingId: weddingId ?? this.weddingId,
      name: name ?? this.name,
      side: side ?? this.side,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      rsvpStatus: rsvpStatus ?? this.rsvpStatus,
      foodPreference: foodPreference ?? this.foodPreference,
      invitationSent: invitationSent ?? this.invitationSent,
      roomAllocation: roomAllocation ?? this.roomAllocation,
      tableNumber: tableNumber ?? this.tableNumber,
      giftReceived: giftReceived ?? this.giftReceived,
      giftValue: giftValue ?? this.giftValue,
      thankYouSent: thankYouSent ?? this.thankYouSent,
      notes: notes ?? this.notes,
    );
  }
}

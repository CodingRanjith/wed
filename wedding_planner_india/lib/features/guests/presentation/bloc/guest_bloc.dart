import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';
import 'package:wedding_planner_india/core/constants/app_constants.dart';
import 'package:wedding_planner_india/domain/entities/guest_entity.dart';
import 'package:wedding_planner_india/domain/repositories/wedding_repository.dart';

part 'guest_event.dart';
part 'guest_state.dart';

const _uuid = Uuid();

class GuestBloc extends Bloc<GuestEvent, GuestState> {
  GuestBloc({required GuestRepository guestRepository})
      : _guestRepository = guestRepository,
        super(const GuestState()) {
    on<GuestLoadRequested>(_onLoad);
    on<GuestAdded>(_onAdded);
    on<GuestUpdated>(_onUpdated);
    on<GuestDeleted>(_onDeleted);
  }

  final GuestRepository _guestRepository;

  Future<void> _onLoad(
    GuestLoadRequested event,
    Emitter<GuestState> emit,
  ) async {
    emit(state.copyWith(status: GuestStatus.loading));
    try {
      final guests = await _guestRepository.getGuests(event.weddingId);
      emit(state.copyWith(status: GuestStatus.loaded, guests: guests));
    } catch (e) {
      emit(state.copyWith(status: GuestStatus.error));
    }
  }

  Future<void> _onAdded(GuestAdded event, Emitter<GuestState> emit) async {
    final guest = GuestEntity(
      id: _uuid.v4(),
      weddingId: event.weddingId,
      name: event.name,
      side: event.side,
      phone: event.phone,
      rsvpStatus: event.rsvpStatus,
      foodPreference: event.foodPreference,
    );
    await _guestRepository.saveGuest(guest);
    emit(state.copyWith(guests: [...state.guests, guest]));
  }

  Future<void> _onUpdated(
    GuestUpdated event,
    Emitter<GuestState> emit,
  ) async {
    await _guestRepository.saveGuest(event.guest);
    final updated = state.guests
        .map((g) => g.id == event.guest.id ? event.guest : g)
        .toList();
    emit(state.copyWith(guests: updated));
  }

  Future<void> _onDeleted(
    GuestDeleted event,
    Emitter<GuestState> emit,
  ) async {
    await _guestRepository.deleteGuest(event.guestId);
    emit(state.copyWith(
      guests: state.guests.where((g) => g.id != event.guestId).toList(),
    ));
  }
}

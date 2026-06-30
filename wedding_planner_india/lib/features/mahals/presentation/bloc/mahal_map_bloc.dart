import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:wedding_planner_india/core/services/live_location_service.dart';
import 'package:wedding_planner_india/data/datasources/local/mahal_sample_data.dart';
import 'package:wedding_planner_india/domain/entities/mahal_entity.dart';
import 'package:wedding_planner_india/domain/repositories/mahal_repository.dart';

part 'mahal_map_event.dart';
part 'mahal_map_state.dart';

class MahalMapBloc extends Bloc<MahalMapEvent, MahalMapState> {
  MahalMapBloc({
    required MahalRepository repository,
    required LiveLocationService liveLocationService,
  })  : _repository = repository,
        _liveLocationService = liveLocationService,
        super(const MahalMapState()) {
    on<MahalMapLoadRequested>(_onLoad);
    on<MahalMapRangeChanged>(_onRangeChanged);
    on<MahalMapMahalSelected>(_onMahalSelected);
    on<MahalMapLiveLocationUpdated>(_onLiveLocationUpdated);
    on<MahalMapFollowUserToggled>(_onFollowUserToggled);
  }

  final MahalRepository _repository;
  final LiveLocationService _liveLocationService;
  StreamSubscription<Position>? _locationSub;

  Future<void> _onLoad(
    MahalMapLoadRequested event,
    Emitter<MahalMapState> emit,
  ) async {
    emit(state.copyWith(status: MahalMapStatus.loading));

    double lat = MahalSampleData.defaultLat;
    double lng = MahalSampleData.defaultLng;
    var locationDenied = false;

    final position = await _liveLocationService.getCurrentPosition();
    if (position != null) {
      lat = position.latitude;
      lng = position.longitude;
    } else {
      locationDenied = true;
    }

    final mahals = _repository.getMahalsInRange(
      userLat: lat,
      userLng: lng,
      rangeKm: state.rangeKm,
    );

    emit(state.copyWith(
      status: MahalMapStatus.loaded,
      userLat: lat,
      userLng: lng,
      mahals: mahals,
      locationDenied: locationDenied,
      isLiveTracking: !locationDenied,
    ));

    await _locationSub?.cancel();
    if (!locationDenied) {
      final started = await _liveLocationService.startTracking();
      if (started) {
        _locationSub = _liveLocationService.positionStream.listen((pos) {
          add(MahalMapLiveLocationUpdated(pos.latitude, pos.longitude));
        });
      }
    }
  }

  void _onLiveLocationUpdated(
    MahalMapLiveLocationUpdated event,
    Emitter<MahalMapState> emit,
  ) {
    final mahals = _repository.getMahalsInRange(
      userLat: event.latitude,
      userLng: event.longitude,
      rangeKm: state.rangeKm,
    );
    emit(state.copyWith(
      userLat: event.latitude,
      userLng: event.longitude,
      mahals: mahals,
      isLiveTracking: true,
    ));
  }

  void _onRangeChanged(
    MahalMapRangeChanged event,
    Emitter<MahalMapState> emit,
  ) {
    final mahals = _repository.getMahalsInRange(
      userLat: state.userLat,
      userLng: state.userLng,
      rangeKm: event.rangeKm,
    );
    emit(state.copyWith(rangeKm: event.rangeKm, mahals: mahals));
  }

  void _onMahalSelected(
    MahalMapMahalSelected event,
    Emitter<MahalMapState> emit,
  ) {
    emit(state.copyWith(selectedMahalId: event.mahalId));
  }

  void _onFollowUserToggled(
    MahalMapFollowUserToggled event,
    Emitter<MahalMapState> emit,
  ) {
    emit(state.copyWith(followUser: event.follow));
  }

  @override
  Future<void> close() {
    _locationSub?.cancel();
    return super.close();
  }
}

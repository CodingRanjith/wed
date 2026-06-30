part of 'mahal_map_bloc.dart';

sealed class MahalMapEvent extends Equatable {
  const MahalMapEvent();

  @override
  List<Object?> get props => [];
}

class MahalMapLoadRequested extends MahalMapEvent {
  const MahalMapLoadRequested();
}

class MahalMapRangeChanged extends MahalMapEvent {
  const MahalMapRangeChanged(this.rangeKm);

  final double rangeKm;

  @override
  List<Object?> get props => [rangeKm];
}

class MahalMapMahalSelected extends MahalMapEvent {
  const MahalMapMahalSelected(this.mahalId);

  final String? mahalId;

  @override
  List<Object?> get props => [mahalId];
}

class MahalMapLiveLocationUpdated extends MahalMapEvent {
  const MahalMapLiveLocationUpdated(this.latitude, this.longitude);

  final double latitude;
  final double longitude;

  @override
  List<Object?> get props => [latitude, longitude];
}

class MahalMapFollowUserToggled extends MahalMapEvent {
  const MahalMapFollowUserToggled(this.follow);

  final bool follow;

  @override
  List<Object?> get props => [follow];
}

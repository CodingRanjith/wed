part of 'mahal_map_bloc.dart';

enum MahalMapStatus { initial, loading, loaded, error }

class MahalMapState extends Equatable {
  const MahalMapState({
    this.status = MahalMapStatus.initial,
    this.userLat = MahalSampleData.defaultLat,
    this.userLng = MahalSampleData.defaultLng,
    this.rangeKm = 5,
    this.mahals = const [],
    this.selectedMahalId,
    this.locationDenied = false,
    this.isLiveTracking = false,
    this.followUser = true,
  });

  final MahalMapStatus status;
  final double userLat;
  final double userLng;
  final double rangeKm;
  final List<MahalWithDistance> mahals;
  final String? selectedMahalId;
  final bool locationDenied;
  final bool isLiveTracking;
  final bool followUser;

  MahalMapState copyWith({
    MahalMapStatus? status,
    double? userLat,
    double? userLng,
    double? rangeKm,
    List<MahalWithDistance>? mahals,
    String? selectedMahalId,
    bool? locationDenied,
    bool? isLiveTracking,
    bool? followUser,
  }) {
    return MahalMapState(
      status: status ?? this.status,
      userLat: userLat ?? this.userLat,
      userLng: userLng ?? this.userLng,
      rangeKm: rangeKm ?? this.rangeKm,
      mahals: mahals ?? this.mahals,
      selectedMahalId: selectedMahalId,
      locationDenied: locationDenied ?? this.locationDenied,
      isLiveTracking: isLiveTracking ?? this.isLiveTracking,
      followUser: followUser ?? this.followUser,
    );
  }

  @override
  List<Object?> get props => [
        status,
        userLat,
        userLng,
        rangeKm,
        mahals,
        selectedMahalId,
        locationDenied,
        isLiveTracking,
        followUser,
      ];
}

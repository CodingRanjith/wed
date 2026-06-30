import 'package:equatable/equatable.dart';
import 'package:wedding_planner_india/core/constants/app_constants.dart';

class WeddingEntity extends Equatable {
  const WeddingEntity({
    required this.id,
    required this.brideName,
    required this.groomName,
    required this.weddingDate,
    required this.location,
    required this.weddingType,
    required this.budget,
    required this.guestCount,
    required this.religion,
    required this.tradition,
    required this.currency,
    this.createdAt,
  });

  final String id;
  final String brideName;
  final String groomName;
  final DateTime weddingDate;
  final String location;
  final WeddingType weddingType;
  final double budget;
  final int guestCount;
  final String religion;
  final String tradition;
  final String currency;
  final DateTime? createdAt;

  int get daysUntilWedding {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final wedding = DateTime(
      weddingDate.year,
      weddingDate.month,
      weddingDate.day,
    );
    return wedding.difference(today).inDays;
  }

  @override
  List<Object?> get props => [
        id,
        brideName,
        groomName,
        weddingDate,
        location,
        weddingType,
        budget,
        guestCount,
        religion,
        tradition,
        currency,
      ];
}

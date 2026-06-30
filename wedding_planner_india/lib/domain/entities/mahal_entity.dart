import 'package:equatable/equatable.dart';

class MahalReview extends Equatable {
  const MahalReview({
    required this.id,
    required this.userName,
    required this.rating,
    required this.comment,
    required this.date,
  });

  final String id;
  final String userName;
  final double rating;
  final String comment;
  final DateTime date;

  @override
  List<Object?> get props => [id, userName, rating, comment, date];
}

class MahalEntity extends Equatable {
  const MahalEntity({
    required this.id,
    required this.name,
    required this.address,
    required this.phone,
    required this.latitude,
    required this.longitude,
    required this.rating,
    required this.reviewCount,
    required this.capacity,
    required this.pricePerPlate,
    required this.imageUrls,
    required this.reviews,
    this.amenities = const [],
  });

  final String id;
  final String name;
  final String address;
  final String phone;
  final double latitude;
  final double longitude;
  final double rating;
  final int reviewCount;
  final int capacity;
  final String pricePerPlate;
  final List<String> imageUrls;
  final List<MahalReview> reviews;
  final List<String> amenities;

  @override
  List<Object?> get props => [
        id,
        name,
        address,
        phone,
        latitude,
        longitude,
        rating,
        reviewCount,
        capacity,
        pricePerPlate,
        imageUrls,
        reviews,
        amenities,
      ];
}

class MahalWithDistance extends Equatable {
  const MahalWithDistance({
    required this.mahal,
    required this.distanceKm,
  });

  final MahalEntity mahal;
  final double distanceKm;

  @override
  List<Object?> get props => [mahal, distanceKm];
}

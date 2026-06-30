import 'package:wedding_planner_india/domain/entities/mahal_entity.dart';

/// Offline sample marriage mahal data (Chennai region). No backend required.
class MahalSampleData {
  MahalSampleData._();

  static const double defaultLat = 13.0827;
  static const double defaultLng = 80.2707;

  static List<MahalEntity> get all => [
        _mahal(
          id: 'm1',
          name: 'Sri Lakshmi Marriage Mahal',
          address: 'Anna Salai, T Nagar, Chennai',
          phone: '+914412345601',
          lat: 13.0418,
          lng: 80.2341,
          rating: 4.6,
          reviewCount: 328,
          capacity: 800,
          price: '₹450/plate',
          amenities: ['AC', 'Parking', 'Catering'],
        ),
        _mahal(
          id: 'm2',
          name: 'Golden Temple Kalyana Mandapam',
          address: 'Velachery Main Rd, Chennai',
          phone: '+914412345602',
          lat: 12.9815,
          lng: 80.2180,
          rating: 4.4,
          reviewCount: 256,
          capacity: 600,
          price: '₹380/plate',
          amenities: ['AC', 'Valet', 'Stage'],
        ),
        _mahal(
          id: 'm3',
          name: 'Aishwarya Wedding Hall',
          address: 'OMR, Sholinganallur, Chennai',
          phone: '+914412345603',
          lat: 12.8996,
          lng: 80.2275,
          rating: 4.8,
          reviewCount: 412,
          capacity: 1000,
          price: '₹520/plate',
          amenities: ['AC', 'Bridal Room', 'Parking'],
        ),
        _mahal(
          id: 'm4',
          name: 'Meenakshi Sundareswarar Mandapam',
          address: 'Mylapore, Chennai',
          phone: '+914412345604',
          lat: 13.0368,
          lng: 80.2676,
          rating: 4.3,
          reviewCount: 189,
          capacity: 500,
          price: '₹350/plate',
          amenities: ['Traditional', 'Priest Arrangement'],
        ),
        _mahal(
          id: 'm5',
          name: 'Royal Palace Reception Centre',
          address: 'ECR, Neelankarai, Chennai',
          phone: '+914412345605',
          lat: 12.9492,
          lng: 80.2564,
          rating: 4.7,
          reviewCount: 367,
          capacity: 1200,
          price: '₹600/plate',
          amenities: ['AC', 'Beach View', 'Luxury Decor'],
        ),
        _mahal(
          id: 'm6',
          name: 'Sangeetha Kalyana Mandapam',
          address: 'Ambattur, Chennai',
          phone: '+914412345606',
          lat: 13.1143,
          lng: 80.1548,
          rating: 4.2,
          reviewCount: 145,
          capacity: 450,
          price: '₹320/plate',
          amenities: ['Parking', 'Catering'],
        ),
        _mahal(
          id: 'm7',
          name: 'Thirumana Thirumana Mahal',
          address: 'Porur, Chennai',
          phone: '+914412345607',
          lat: 13.0358,
          lng: 80.1568,
          rating: 4.5,
          reviewCount: 278,
          capacity: 700,
          price: '₹400/plate',
          amenities: ['AC', 'Generator', 'Parking'],
        ),
        _mahal(
          id: 'm8',
          name: 'Nandhini Wedding Convention',
          address: 'Tambaram, Chennai',
          phone: '+914412345608',
          lat: 12.9249,
          lng: 80.1000,
          rating: 4.1,
          reviewCount: 98,
          capacity: 900,
          price: '₹340/plate',
          amenities: ['AC', 'Large Hall'],
        ),
        _mahal(
          id: 'm9',
          name: 'Vaibhav Kalyana Mandapam',
          address: 'Adyar, Chennai',
          phone: '+914412345609',
          lat: 13.0067,
          lng: 80.2575,
          rating: 4.6,
          reviewCount: 301,
          capacity: 550,
          price: '₹420/plate',
          amenities: ['AC', 'Garden', 'Parking'],
        ),
        _mahal(
          id: 'm10',
          name: 'Sri Renga Marriage Hall',
          address: 'Chromepet, Chennai',
          phone: '+914412345610',
          lat: 12.9516,
          lng: 80.1392,
          rating: 4.0,
          reviewCount: 76,
          capacity: 400,
          price: '₹300/plate',
          amenities: ['Budget Friendly', 'Parking'],
        ),
        _mahal(
          id: 'm11',
          name: 'Grand Chola Wedding Palace',
          address: 'Guindy, Chennai',
          phone: '+914412345611',
          lat: 13.0108,
          lng: 80.2125,
          rating: 4.9,
          reviewCount: 489,
          capacity: 1500,
          price: '₹750/plate',
          amenities: ['5 Star', 'AC', 'Valet', 'Luxury'],
        ),
        _mahal(
          id: 'm12',
          name: 'Kamakshi Thirumana Nilayam',
          address: 'Koyambedu, Chennai',
          phone: '+914412345612',
          lat: 13.0694,
          lng: 80.1948,
          rating: 4.3,
          reviewCount: 167,
          capacity: 650,
          price: '₹370/plate',
          amenities: ['AC', 'Metro Nearby'],
        ),
      ];

  static MahalEntity? byId(String id) {
    try {
      return all.firstWhere((m) => m.id == id);
    } catch (_) {
      return null;
    }
  }

  static MahalEntity _mahal({
    required String id,
    required String name,
    required String address,
    required String phone,
    required double lat,
    required double lng,
    required double rating,
    required int reviewCount,
    required int capacity,
    required String price,
    required List<String> amenities,
  }) {
    return MahalEntity(
      id: id,
      name: name,
      address: address,
      phone: phone,
      latitude: lat,
      longitude: lng,
      rating: rating,
      reviewCount: reviewCount,
      capacity: capacity,
      pricePerPlate: price,
      imageUrls: [
        'https://images.unsplash.com/photo-1519225421980-715cb0215aed?w=800',
        'https://images.unsplash.com/photo-1464366400600-7168b8af9bc3?w=800',
        'https://images.unsplash.com/photo-1470225620780-dba8ba36b745?w=800',
      ],
      amenities: amenities,
      reviews: _reviewsFor(name, reviewCount),
    );
  }

  static List<MahalReview> _reviewsFor(String mahalName, int totalReviews) {
    return [
      MahalReview(
        id: '${mahalName}_r1',
        userName: 'Priya R.',
        rating: 5,
        comment:
            'Excellent hall for Tamil wedding. Food quality was superb and staff very helpful.',
        date: DateTime(2025, 11, 12),
      ),
      MahalReview(
        id: '${mahalName}_r2',
        userName: 'Karthik M.',
        rating: 4.5,
        comment:
            'Spacious mandapam with good parking. Decoration team coordination was smooth.',
        date: DateTime(2025, 10, 5),
      ),
      MahalReview(
        id: '${mahalName}_r3',
        userName: 'Divya S.',
        rating: 4,
        comment:
            'Value for money reception. AC worked well even with $totalReviews+ guest events.',
        date: DateTime(2025, 8, 20),
      ),
      MahalReview(
        id: '${mahalName}_r4',
        userName: 'Arun V.',
        rating: 4.5,
        comment: 'Nadaswaram entry and stage setup was perfect. Highly recommended.',
        date: DateTime(2025, 6, 15),
      ),
    ];
  }
}

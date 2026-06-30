import 'package:flutter/material.dart';
import 'package:wedding_planner_india/core/theme/app_colors.dart';
import 'package:wedding_planner_india/domain/entities/mahal_entity.dart';

class MahalListTile extends StatelessWidget {
  const MahalListTile({
    super.key,
    required this.item,
    required this.onTap,
    required this.onCall,
    required this.onDirections,
    this.isSelected = false,
  });

  final MahalWithDistance item;
  final VoidCallback onTap;
  final VoidCallback onCall;
  final VoidCallback onDirections;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    final mahal = item.mahal;

    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      color: isSelected
          ? AppColors.primary.withValues(alpha: 0.08)
          : null,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  mahal.imageUrls.first,
                  width: 88,
                  height: 88,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => Container(
                    width: 88,
                    height: 88,
                    color: AppColors.primary.withValues(alpha: 0.15),
                    child: const Icon(Icons.temple_hindu, size: 36),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      mahal.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        const Icon(Icons.star, color: Colors.amber, size: 16),
                        Text(' ${mahal.rating}'),
                        const SizedBox(width: 8),
                        const Icon(Icons.reviews, size: 16),
                        Text(' ${mahal.reviewCount}'),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '${item.distanceKm.toStringAsFixed(1)} km • ${mahal.pricePerPlate}',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        const Icon(Icons.phone, size: 14),
                        const SizedBox(width: 4),
                        Expanded(
                          child: Text(
                            mahal.phone,
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        TextButton.icon(
                          onPressed: onCall,
                          icon: const Icon(Icons.call, size: 18),
                          label: const Text('Call'),
                        ),
                        TextButton.icon(
                          onPressed: onDirections,
                          icon: const Icon(Icons.directions, size: 18),
                          label: const Text('Route'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

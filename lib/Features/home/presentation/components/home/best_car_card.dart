import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quent/core/cubits/theme_cubit/theme_cubit.dart';
import 'package:quent/core/resources/app_color.dart';

class BestCarCard extends StatelessWidget {
  final String imageUrl;
  final String name;
  final double rating;
  final String location;
  final int seats;
  final String pricePerDay;
  final VoidCallback? onTap;
  final VoidCallback? onFavoriteTap;
  final bool isFavorite;

  const BestCarCard({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.rating,
    required this.location,
    required this.seats,
    required this.pricePerDay,
    this.onTap,
    this.onFavoriteTap,
    this.isFavorite = false,
  });

  @override
  Widget build(BuildContext context) {
    final isDarkMode = context.watch<ThemeCubit>().isDarkMode;
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isDarkMode
                ? AppColors.surfaceDarkColor
                : AppColors.surfaceLightColor,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(16),
                  ),
                  child: AspectRatio(
                    aspectRatio: 16 / 9,
                    child: Image.network(imageUrl, fit: BoxFit.cover),
                  ),
                ),

                Positioned(
                  top: 10,
                  right: 10,
                  child: IconButton(
                    style: IconButton.styleFrom(
                      backgroundColor: isDarkMode
                          ? AppColors.surfaceDarkColor
                          : AppColors.surfaceLightColor,
                    ),
                    onPressed: onFavoriteTap,
                    icon: Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: isFavorite ? Colors.red : AppColors.black,
                    ),
                  ),
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: theme.textTheme.titleMedium,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.amber),
                      const SizedBox(width: 4),
                      Text(
                        rating.toString(),
                        style: theme.textTheme.titleMedium,
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.location_on_outlined),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          location,
                          style: theme.textTheme.titleSmall?.copyWith(),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.event_seat),
                          const SizedBox(width: 4),
                          Text(
                            '$seats Seats',
                            style: theme.textTheme.titleSmall,
                          ),
                        ],
                      ),
                      Text(pricePerDay, style: theme.textTheme.titleMedium),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

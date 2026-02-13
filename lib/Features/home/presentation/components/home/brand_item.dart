import 'package:flutter/material.dart';
import 'package:quent/core/resources/app_radius.dart';
import 'package:quent/core/resources/app_size.dart';

class BrandItem extends StatelessWidget {
  final String imageUrl;
  final VoidCallback onTap;

  const BrandItem({super.key, required this.imageUrl, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            height: AppRadius.r40 * 2,
            width: AppRadius.r40 * 2,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: NetworkImage(imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: AppSize.s4),
          Text(
            'Brand name',
            style: Theme.of(context).textTheme.titleSmall,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ],
      ),
    );
  }
}

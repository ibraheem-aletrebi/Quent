import 'package:flutter/material.dart';
import 'package:quent/Features/home/presentation/components/home/brand_item.dart';
import 'package:quent/core/resources/app_radius.dart';
import 'package:quent/core/resources/app_size.dart';
import 'package:quent/core/widgets/section_header.dart';

class HomeSliverBrandingSection extends StatelessWidget {
  const HomeSliverBrandingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionHeader(title: 'Branding', onActionTap: () {}),
          SizedBox(height: AppSize.s4),
          SizedBox(
            height: AppRadius.r48 * 2 + AppSize.s12,
            child: ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: AppSize.s12),
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemCount: 8,
              separatorBuilder: (_, _) => const SizedBox(width: 12),
              itemBuilder: (context, index) {
                return BrandItem(
                  imageUrl: 'https://picsum.photos/200?random=$index',
                  onTap: () {},
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

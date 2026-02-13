import 'package:flutter/material.dart';
import 'package:quent/core/resources/app_color.dart';
import 'package:quent/core/resources/app_padding.dart';
import 'package:quent/core/resources/app_radius.dart';
import 'package:quent/core/resources/app_size.dart';
import 'package:quent/core/widgets/custom_logo.dart';

class HomeSliverAppBar extends StatelessWidget {
  const HomeSliverAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: false,
      floating: false,
      surfaceTintColor: AppColors.transparent,
      expandedHeight: AppSize.s65,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1),
        child: const Divider(),
      ),
      leading: const SizedBox(),
      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.parallax,
        centerTitle: false,
        titlePadding: EdgeInsets.symmetric(
          horizontal: AppPadding.p16,
          vertical: AppPadding.p8,
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const CustomLogo(),
            Row(
              spacing: 8,
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.notifications_none_rounded),
                    ),
                    Positioned(
                      top: 0,
                      right: 0,
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        constraints: const BoxConstraints(
                          minWidth: 16,
                          minHeight: 16,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          shape: BoxShape.circle,
                        ),
                        child: Text(
                          '3',
                          style: TextTheme.of(
                            context,
                          ).titleSmall?.copyWith(fontSize: AppSize.s10),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {},
                  child: CircleAvatar(
                    radius: AppRadius.r18,
                    backgroundImage: const NetworkImage(
                      "https://images.unsplash.com/photo-1535713875002-d1d0cf377fde",
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

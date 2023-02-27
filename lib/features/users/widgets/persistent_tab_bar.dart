import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/breakpoint.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/utils/utils.dart';

class PersistentTabBar extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final size = MediaQuery.of(context).size;
    bool isDark = isDarkMode(context);
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.only(
        top: Sizes.size10,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).appBarTheme.backgroundColor,
        border: Border.symmetric(
          horizontal: BorderSide(
            color: isDark ? Colors.grey.shade800 : Colors.grey.shade100,
          ),
        ),
      ),
      child: TabBar(
        indicatorPadding: const EdgeInsets.symmetric(horizontal: Sizes.size8),
        isScrollable: size.width > Breakpoints.sm,
        indicatorSize: TabBarIndicatorSize.label,
        labelPadding: const EdgeInsets.only(
          bottom: Sizes.size10,
        ),
        indicatorColor: Theme.of(context).tabBarTheme.indicatorColor,
        tabs: [
          Padding(
            padding: size.width > Breakpoints.sm
                ? const EdgeInsets.symmetric(horizontal: Sizes.size36)
                : const EdgeInsets.symmetric(horizontal: Sizes.size10),
            child: const Icon(Icons.grid_4x4_rounded),
          ),
          Padding(
            padding: size.width > Breakpoints.sm
                ? const EdgeInsets.symmetric(horizontal: Sizes.size36)
                : const EdgeInsets.symmetric(horizontal: Sizes.size10),
            child: const FaIcon(FontAwesomeIcons.heart),
          ),
        ],
      ),
    );
  }

  @override
  double get maxExtent => 47;

  @override
  double get minExtent => 47;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}

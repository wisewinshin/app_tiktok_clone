import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/breakpoint.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class PostGrid extends StatelessWidget {
  const PostGrid({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GridView.builder(
      padding: EdgeInsets.zero,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: size.width > Breakpoints.md
            ? 6
            : size.width > Breakpoints.sm
                ? 4
                : 3,
        crossAxisSpacing: Sizes.size1,
        mainAxisSpacing: Sizes.size1,
        childAspectRatio: 9 / 16,
      ),
      itemBuilder: (context, index) => Stack(
        children: [
          AspectRatio(
            aspectRatio: 9 / 16,
            child: FadeInImage.assetNetwork(
              fit: BoxFit.cover,
              placeholderFit: BoxFit.cover,
              placeholder: "assets/images/placeholder.jpg",
              image:
                  "https://images.unsplash.com/photo-1619650277752-9b853abf815b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=3840&q=80",
            ),
          ),
          Positioned(
            bottom: Sizes.size4,
            left: Sizes.size8,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: const [
                FaIcon(
                  FontAwesomeIcons.play,
                  color: Colors.white,
                  size: Sizes.size16,
                ),
                Gaps.h4,
                Text(
                  "4.1M",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class ActivityScreen extends StatelessWidget {
  const ActivityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "All Activity",
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: Sizes.size16,
        ),
        children: [
          Gaps.v14,
          Text(
            "New",
            style: TextStyle(
              fontSize: Sizes.size16,
              color: Colors.grey.shade400,
            ),
          ),
          Gaps.v14,
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                border: Border.all(
                  color: Colors.grey.shade600,
                  width: Sizes.size2,
                ),
              ),
              width: Sizes.size52,
              child: const Center(
                child: FaIcon(
                  FontAwesomeIcons.bell,
                  color: Colors.black,
                  size: Sizes.size32,
                ),
              ),
            ),
            title: RichText(
              text: TextSpan(
                text: "Account updates:",
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                  fontSize: Sizes.size16,
                ),
                children: [
                  const TextSpan(
                    text: " Uploade longer videos",
                    style: TextStyle(fontWeight: FontWeight.normal),
                  ),
                  TextSpan(
                    text: " 1h",
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      color: Colors.grey.shade400,
                    ),
                  ),
                ],
              ),
            ),
            trailing: const FaIcon(
              FontAwesomeIcons.chevronRight,
            ),
          )
        ],
      ),
    );
  }
}

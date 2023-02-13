import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';

class NavTab extends StatelessWidget {
  const NavTab({
    super.key,
    required this.text,
    required this.isSelected,
    required this.selectedIcon,
    required this.icon,
    required this.onTap,
  });

  final String text;
  final bool isSelected;
  final FaIcon selectedIcon;
  final FaIcon icon;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () => onTap(),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0),
          ),
          child: AnimatedOpacity(
            opacity: isSelected ? 1 : 0.6,
            duration: const Duration(
              milliseconds: 200,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                isSelected ? selectedIcon : icon,
                Gaps.v5,
                Text(
                  text,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/utils/utils.dart';

class PostVideoButton extends StatefulWidget {
  final bool inverted;
  final VoidCallback onTap;
  const PostVideoButton({
    super.key,
    required this.inverted,
    required this.onTap,
  });

  @override
  State<PostVideoButton> createState() => _PostVideoButtonState();
}

class _PostVideoButtonState extends State<PostVideoButton> {
  bool isHover = false;

  void _onTapDown(TapDownDetails details) {
    setState(() {
      isHover = true;
    });
  }

  void _onTapUp(TapUpDetails details) {
    setState(() {
      isHover = false;
    });
  }

  void _onTapCancel() {
    setState(() {
      isHover = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDark = isDarkMode(context);
    return GestureDetector(
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      onTapCancel: _onTapCancel,
      onTap: widget.onTap,
      child: AnimatedScale(
        curve: Curves.easeIn,
        scale: isHover ? 1.1 : 1,
        duration: const Duration(
          milliseconds: 200,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.size10,
          ),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(
                left: 4,
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(
                      Sizes.size8,
                    ),
                  ),
                  height: 34,
                  width: 42,
                ),
              ),
              Positioned(
                right: 4,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.blue.shade300,
                    borderRadius: BorderRadius.circular(
                      Sizes.size8,
                    ),
                  ),
                  height: 34,
                  width: 42,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color:
                      !widget.inverted || isDark ? Colors.white : Colors.black,
                  borderRadius: BorderRadius.circular(
                    Sizes.size4,
                  ),
                ),
                height: 34,
                width: 42,
                child: Center(
                  child: FaIcon(
                    FontAwesomeIcons.plus,
                    size: Sizes.size20,
                    color: !widget.inverted || isDark
                        ? Colors.black
                        : Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

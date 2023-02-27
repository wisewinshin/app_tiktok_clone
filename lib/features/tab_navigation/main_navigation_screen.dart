import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/features/discover/discover_screen.dart';
import 'package:tiktok_clone/features/inbox/inbox_screent.dart';
import 'package:tiktok_clone/features/tab_navigation/test_screen.dart';
import 'package:tiktok_clone/features/tab_navigation/widgets/nav_tab.dart';
import 'package:tiktok_clone/features/tab_navigation/widgets/post_video_button.dart';
import 'package:tiktok_clone/features/users/user_profile_screen.dart';
import 'package:tiktok_clone/features/videos/videos_timeline_screen.dart';
import 'package:tiktok_clone/utils/utils.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _selectedIndex = 4;

  void _onTap(int index) {
    if (index != _selectedIndex) {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  void _onPostVideoBottonTap() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => Container(),
        fullscreenDialog: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            Offstage(
              offstage: _selectedIndex != 0,
              child: const VideoTimelineScreen(),
            ),
            Offstage(
              offstage: _selectedIndex != 1,
              child: const DiscoverScreen(),
            ),
            Offstage(
              offstage: _selectedIndex != 2,
              child: const TestScreen(),
            ),
            Offstage(
              offstage: _selectedIndex != 3,
              child: const InboxScreen(),
            ),
            Offstage(
              offstage: _selectedIndex != 4,
              child: const UserProfileScreen(),
            ),
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          padding: const EdgeInsets.symmetric(vertical: 8),
          color: _selectedIndex == 0 || isDarkMode(context)
              ? Colors.black
              : Colors.white,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              NavTab(
                text: "Home",
                isSelected: _selectedIndex == 0,
                selectedIcon: FontAwesomeIcons.house,
                icon: FontAwesomeIcons.house,
                onTap: () => _onTap(0),
                selectedIndex: _selectedIndex,
              ),
              NavTab(
                text: "Discover",
                isSelected: _selectedIndex == 1,
                selectedIcon: FontAwesomeIcons.compass,
                icon: FontAwesomeIcons.magnifyingGlass,
                onTap: () => _onTap(1),
                selectedIndex: _selectedIndex,
              ),
              GestureDetector(
                  onTap: _onPostVideoBottonTap,
                  child: PostVideoButton(inverted: _selectedIndex != 0)),
              NavTab(
                text: "Inbox",
                isSelected: _selectedIndex == 3,
                selectedIcon: FontAwesomeIcons.solidMessage,
                icon: FontAwesomeIcons.message,
                onTap: () => _onTap(3),
                selectedIndex: _selectedIndex,
              ),
              NavTab(
                text: "User",
                isSelected: _selectedIndex == 4,
                selectedIcon: FontAwesomeIcons.solidUser,
                icon: FontAwesomeIcons.user,
                onTap: () => _onTap(4),
                selectedIndex: _selectedIndex,
              ),
            ],
          ),
        ));
  }
}

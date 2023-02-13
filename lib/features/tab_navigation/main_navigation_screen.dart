import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/features/tab_navigation/test_screen.dart';
import 'package:tiktok_clone/features/tab_navigation/widgets/nav_tab.dart';
import 'package:tiktok_clone/features/tab_navigation/widgets/post_video_button.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _selectedIndex = 0;

  final screens = [
    TestScreen(
      key: GlobalKey(),
    ),
    TestScreen(
      key: GlobalKey(),
    ),
    TestScreen(
      key: GlobalKey(),
    ),
    TestScreen(
      key: GlobalKey(),
    ),
    TestScreen(
      key: GlobalKey(),
    ),
  ];

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
        body: Stack(
          children: [
            Offstage(
              offstage: _selectedIndex != 0,
              child: const TestScreen(),
            ),
            Offstage(
              offstage: _selectedIndex != 1,
              child: const TestScreen(),
            ),
            Offstage(
              offstage: _selectedIndex != 2,
              child: const TestScreen(),
            ),
            Offstage(
              offstage: _selectedIndex != 3,
              child: const TestScreen(),
            ),
            Offstage(
              offstage: _selectedIndex != 4,
              child: const TestScreen(),
            ),
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          padding: const EdgeInsets.symmetric(vertical: 8),
          color: Colors.black,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              NavTab(
                text: "Home",
                isSelected: _selectedIndex == 0,
                selectedIcon: const FaIcon(
                  FontAwesomeIcons.house,
                  color: Colors.white,
                ),
                icon: const FaIcon(
                  FontAwesomeIcons.house,
                  color: Colors.white,
                ),
                onTap: () => _onTap(0),
              ),
              NavTab(
                text: "Discover",
                isSelected: _selectedIndex == 1,
                selectedIcon: const FaIcon(
                  FontAwesomeIcons.compass,
                  color: Colors.white,
                ),
                icon: const FaIcon(
                  FontAwesomeIcons.magnifyingGlass,
                  color: Colors.white,
                ),
                onTap: () => _onTap(1),
              ),
              GestureDetector(
                  onTap: _onPostVideoBottonTap, child: const PostVideoButton()),
              NavTab(
                text: "Inbox",
                isSelected: _selectedIndex == 3,
                selectedIcon: const FaIcon(
                  FontAwesomeIcons.solidMessage,
                  color: Colors.white,
                ),
                icon: const FaIcon(
                  FontAwesomeIcons.message,
                  color: Colors.white,
                ),
                onTap: () => _onTap(3),
              ),
              NavTab(
                text: "User",
                isSelected: _selectedIndex == 4,
                selectedIcon: const FaIcon(
                  FontAwesomeIcons.solidUser,
                  color: Colors.white,
                ),
                icon: const FaIcon(
                  FontAwesomeIcons.user,
                  color: Colors.white,
                ),
                onTap: () => _onTap(4),
              ),
            ],
          ),
        ));
  }
}

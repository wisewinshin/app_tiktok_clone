import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/features/tab_navigation/widgets/nav_tab.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _selectedIndex = 0;

  final screens = [
    const Center(
      child: Text("home"),
    ),
    const Center(
      child: Text("home2"),
    ),
    const Center(
      child: Text("home3"),
    ),
    const Center(
      child: Text("home4"),
    ),
    const Center(
      child: Text("home5"),
    )
  ];

  void _onTap(int index) {
    if (index != _selectedIndex) {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: screens[_selectedIndex],
        bottomNavigationBar: BottomAppBar(
          padding: const EdgeInsets.symmetric(vertical: 8),
          color: Colors.black,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              NavTab(
                text: "Home",
                isSelected: _selectedIndex == 0,
                icon: const FaIcon(
                  FontAwesomeIcons.house,
                  color: Colors.white,
                ),
                onTap: () => _onTap(0),
              ),
              NavTab(
                text: "Discover",
                isSelected: _selectedIndex == 1,
                icon: const FaIcon(
                  FontAwesomeIcons.magnifyingGlass,
                  color: Colors.white,
                ),
                onTap: () => _onTap(1),
              ),
              NavTab(
                text: "Inbox",
                isSelected: _selectedIndex == 3,
                icon: const FaIcon(
                  FontAwesomeIcons.message,
                  color: Colors.white,
                ),
                onTap: () => _onTap(3),
              ),
              NavTab(
                text: "User",
                isSelected: _selectedIndex == 4,
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

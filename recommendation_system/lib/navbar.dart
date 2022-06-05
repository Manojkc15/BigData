import "package:flutter/material.dart";
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class PersistantBottomNavBar extends StatefulWidget {
  const PersistantBottomNavBar({Key? key}) : super(key: key);

  @override
  State<PersistantBottomNavBar> createState() => _PersistantBottomNavBarState();
}

class _PersistantBottomNavBarState extends State<PersistantBottomNavBar> {
  late PersistentTabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
  }

  List<Widget> screens() {
    return [
      const Screen1(),
      const Screen2(),
    ];
  }

  List<PersistentBottomNavBarItem> navbarItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.home),
        title: "Home",
        activeColorSecondary: Colors.white,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.favorite),
        title: "Favorites",
        activeColorSecondary: Colors.white,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: screens(),
      items: navbarItems(),
      navBarStyle: NavBarStyle.style7,
    );
  }
}

class Screen1 extends StatelessWidget {
  const Screen1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Screen 1",
        style: TextStyle(
          fontSize: 20,
        ),
      ),
    );
  }
}

class Screen2 extends StatelessWidget {
  const Screen2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Screen 2",
        style: TextStyle(
          fontSize: 20,
        ),
      ),
    );
  }
}

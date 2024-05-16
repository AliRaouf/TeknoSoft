import 'package:e_commerce/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

import 'delivery_screen.dart';
import 'home_screen.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      tabs: [
        PersistentTabConfig(
          screen: HomeScreen(),
          item: ItemConfig(
              icon: Icon(Icons.home),
              title: "Home",activeForegroundColor: Color(0xff19c463)
          ),
        ),
        PersistentTabConfig(
          screen: DeliveryScreen(),
          item: ItemConfig(
              icon: Icon(Icons.track_changes),
              title: "Delivery",activeForegroundColor: Color(0xff19c463)
          ),
        ),
        PersistentTabConfig(
          screen: ProfileScreen(),
          item: ItemConfig(
              icon: Icon(Icons.person_outline),
              title: "Profile",activeForegroundColor: Color(0xff19c463)
          ),
        ),
      ],
      navBarBuilder: (navBarConfig) => Style4BottomNavBar(
        navBarConfig: navBarConfig,
      ),
    );
  }
}

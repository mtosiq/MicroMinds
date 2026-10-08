import 'package:MicroMinds/src/views/Profile/profile.dart';
import 'package:MicroMinds/src/views/SearchScreen/searchpage.dart';
import 'package:MicroMinds/src/views/bottomBar.dart';
import 'package:MicroMinds/src/views/home/homepage.dart';
import 'package:MicroMinds/src/views/nutrition.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/app_state.dart';

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  final screens = [
    HomePage(),
    SearchPage(),
    NutritionPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    final navigation = context.watch<NavigationProvider>();

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: screens[navigation.currentIndex],
      bottomNavigationBar: CustomBottomBar(
        currentIndex: navigation.currentIndex,
        onTap: (value) {
          context.read<NavigationProvider>().setIndex(value);
        },
      ),
    );
  }
}

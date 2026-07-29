import 'package:MicroMinds/src/views/Favourites/Favourites.dart';
import 'package:MicroMinds/src/views/Profile/recipes.dart';
import 'package:MicroMinds/src/views/Search_bar/search.dart';
import 'package:MicroMinds/src/views/bottomBar.dart';
import 'package:MicroMinds/src/views/home/homepage.dart';
import 'package:flutter/material.dart';

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int index = 0;

  final screens = const [
    HomePage(),
    SearchPage(),
    FavoritePage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff08090D),
      body: screens[index],
      bottomNavigationBar: CustomBottomBar(
        currentIndex: index,
        onTap: (value) {
          setState(() {
            index = value;
          });
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';

class CustomBottomBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  final Color orange = const Color(0xffff6b4a);
  final Color purple = const Color(0xff9b5cff);

  @override
  Widget build(BuildContext context) {
    final items = [
      {
        "icon": Icons.home_rounded,
        "title": "Home",
      },
      {
        "icon": Icons.search_rounded,
        "title": "Search",
      },
      {
        "icon": Icons.favorite_rounded,
        "title": "Favorite",
      },
      {
        "icon": Icons.person_rounded,
        "title": "Profile",
      },
    ];

    return Container(
      margin: const EdgeInsets.only(
        left: 20,
        right: 20,
        bottom: 18,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: const Color(0xff15171D),
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.4),
            blurRadius: 20,
            offset: const Offset(0, 8),
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(
          items.length,
          (index) {
            bool selected = currentIndex == index;

            return GestureDetector(
              onTap: () {
                onTap(index);
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                padding: selected
                    ? const EdgeInsets.symmetric(
                        horizontal: 18,
                        vertical: 10,
                      )
                    : const EdgeInsets.all(12),
                decoration: selected
                    ? BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            orange,
                            purple,
                          ],
                        ),
                        borderRadius: BorderRadius.circular(25),
                      )
                    : null,
                child: Row(
                  children: [
                    Icon(
                      items[index]["icon"] as IconData,
                      color: selected ? Colors.white : Colors.grey,
                      size: 25,
                    ),
                    if (selected) ...[
                      const SizedBox(width: 8),
                      Text(
                        items[index]["title"] as String,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                        ),
                      )
                    ]
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

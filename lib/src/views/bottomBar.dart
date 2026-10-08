import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';

class CustomBottomBar extends StatelessWidget with ThemeColors {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final items = [
      {
        "icon": Icons.home_outlined,
        "activeIcon": Icons.home_rounded,
        "title": "Home",
      },
      {
        "icon": Icons.search_outlined,
        "activeIcon": Icons.search_rounded,
        "title": "Search",
      },
      {
        "icon": Icons.monitor_heart_outlined,
        "activeIcon": Icons.monitor_heart,
        "title": "Nutrition",
      },
      {
        "icon": Icons.person_outline_rounded,
        "activeIcon": Icons.person_rounded,
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
        horizontal: 8,
        vertical: 9,
      ),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
          color: Colors.white.withOpacity(.04),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.45),
            blurRadius: 25,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(
          items.length,
          (index) {
            final bool selected = currentIndex == index;

            return GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                onTap(index);
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 280),
                curve: Curves.easeOutCubic,
                padding: selected
                    ? const EdgeInsets.symmetric(
                        horizontal: 18,
                        vertical: 10,
                      )
                    : const EdgeInsets.all(11),
                decoration: selected
                    ? BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [
                            orange,
                            purple,
                          ],
                        ),
                        borderRadius: BorderRadius.circular(25),
                        boxShadow: [
                          BoxShadow(
                            color: orange.withOpacity(.18),
                            blurRadius: 12,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      )
                    : null,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      selected
                          ? items[index]["activeIcon"] as IconData
                          : items[index]["icon"] as IconData,
                      color: selected ? Colors.white : Colors.grey.shade500,
                      size: 24,
                    ),
                    if (selected) ...[
                      const SizedBox(width: 7),
                      Text(
                        items[index]["title"] as String,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ],
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

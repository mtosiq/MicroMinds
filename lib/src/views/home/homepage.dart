import 'package:MicroMinds/Recipe.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final Color background = const Color(0xff08090D);
  final Color cardColor = const Color(0xff15171D);
  final Color orange = const Color(0xffff6b4a);
  final Color purple = const Color(0xff9b5cff);

  String getGreeting() {
    final hour = DateTime.now().hour;

    if (hour < 12) {
      return "Good Morning";
    } else if (hour >= 12 && hour < 18) {
      return "Good Afternoon";
    } else {
      return "Good Evening";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),

              /// HEADER

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        getGreeting(),
                        style: TextStyle(
                          color: Colors.grey.shade400,
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        "Muhammad 👋",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: purple.withOpacity(.2),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(children: [
                          Icon(
                            Icons.stars,
                            color: purple,
                            size: 18,
                          ),
                          const SizedBox(width: 5),
                          const Text(
                            "420",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ]),
                      ),
                      const SizedBox(width: 12),
                      Container(
                        height: 42,
                        width: 42,
                        decoration: BoxDecoration(
                          color: cardColor,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.notifications_none,
                          color: Colors.white,
                        ),
                      )
                    ],
                  )
                ],
              ),

              const SizedBox(height: 25),

              /// SEARCH BAR

              Container(
                height: 52,
                decoration: BoxDecoration(
                  color: cardColor,
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Row(
                  children: [
                    const SizedBox(width: 15),
                    Icon(
                      Icons.search,
                      color: Colors.grey,
                    ),
                    const SizedBox(width: 10),
                    const Expanded(
                      child: Text(
                        "Search recipes, ingredients...",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(6),
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                          orange,
                          purple,
                        ]),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: const Icon(
                        Icons.qr_code_scanner,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),

              const SizedBox(height: 25),

              /// PANTRY AI CARD

              Container(
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: cardColor,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Scan your pantry",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            "Get recipe ideas\nwith what you have",
                            style: TextStyle(
                              color: Colors.grey.shade400,
                              fontSize: 13,
                            ),
                          ),
                          const SizedBox(height: 15),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                backgroundColor: orange,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                )),
                            child: const Text(
                              "Scan Now",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: 90,
                      width: 90,
                      decoration: BoxDecoration(
                        color: Colors.black26,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Center(
                        child: Text(
                          "🥕🍅",
                          style: TextStyle(
                            fontSize: 35,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),

              const SizedBox(height: 30),

              /// RECIPE OF DAY TITLE

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Recipe of the Day",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "See all",
                    style: TextStyle(
                      color: purple,
                    ),
                  )
                ],
              ),

              const SizedBox(height: 15),

              /// RECIPE CARD

              GestureDetector(
                onTap: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => RecipeDetailsScre(

                  //         )));
                },
                child: Container(
                  height: 220,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    image: const DecorationImage(
                      image: NetworkImage(
                          "https://images.unsplash.com/photo-1555949258-eb67b1ef0ceb"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(18),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.transparent,
                              Colors.black87,
                            ])),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Spicy Garlic Butter\nShrimp Pasta",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          "⭐ 4.8     ⏱ 32 min",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
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

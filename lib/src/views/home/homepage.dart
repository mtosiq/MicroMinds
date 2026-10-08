import 'package:flutter/material.dart';
import '../../../theme/app_theme.dart';

class HomePage extends StatelessWidget with ThemeColors {
  const HomePage({super.key});

  String getGreeting() {
    final hour = DateTime.now().hour;

    if (hour < 12) {
      return "Good Morning";
    } else if (hour < 18) {
      return "Good Afternoon";
    } else {
      return "Good Evening";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),

              // ============================================================
              // HEADER
              // ============================================================

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
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      // POINTS
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 11,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: purple.withOpacity(.16),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          children: [
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
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(width: 10),

                      // NOTIFICATION
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
                      ),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 25),

              // ============================================================
              // SEARCH BAR
              // ============================================================

              GestureDetector(
                onTap: () {
                  // Navigate to Search Page
                },
                child: Container(
                  height: 52,
                  decoration: BoxDecoration(
                    color: cardColor,
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Row(
                    children: [
                      const SizedBox(width: 15),
                      const Icon(
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
                          gradient: LinearGradient(
                            colors: [
                              orange,
                              purple,
                            ],
                          ),
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: const Icon(
                          Icons.qr_code_scanner,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 25),

              // ============================================================
              // PANTRY AI CARD
              // ============================================================

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
                              elevation: 0,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 18,
                                vertical: 11,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            child: const Text(
                              "Scan Now",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
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
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 28),

              // ============================================================
              // DAILY NUTRITION
              // ============================================================

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Your Daily Goal",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "View details",
                    style: TextStyle(
                      color: purple,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 14),

              Container(
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      AppColors.darkPanel,
                      cardColor,
                    ],
                  ),
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(
                    color: purple.withOpacity(.12),
                  ),
                ),
                child: Column(
                  children: [
                    // GOAL HEADER
                    Row(
                      children: [
                        Container(
                          height: 48,
                          width: 48,
                          decoration: BoxDecoration(
                            color: purple.withOpacity(.12),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Icon(
                            Icons.fitness_center,
                            color: purple,
                          ),
                        ),
                        const SizedBox(width: 12),
                        const Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Build Muscle",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                "Today's nutrition target",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 11,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          "72%",
                          style: TextStyle(
                            color: purple,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 17),

                    // CALORIES
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          "Calories",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 11,
                          ),
                        ),
                        Text(
                          "1,840 / 2,450 kcal",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 7),

                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: LinearProgressIndicator(
                        value: .72,
                        minHeight: 7,
                        backgroundColor: Colors.white.withOpacity(.06),
                        valueColor: AlwaysStoppedAnimation<Color>(
                          orange,
                        ),
                      ),
                    ),

                    const SizedBox(height: 18),

                    // MACROS
                    Row(
                      children: [
                        Expanded(
                          child: _nutritionStat(
                            "Protein",
                            "132g",
                            "/ 160g",
                            purple,
                          ),
                        ),
                        Expanded(
                          child: _nutritionStat(
                            "Carbs",
                            "210g",
                            "/ 280g",
                            orange,
                          ),
                        ),
                        Expanded(
                          child: _nutritionStat(
                            "Fat",
                            "52g",
                            "/ 70g",
                            green,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 16),

                    // WATER
                    Row(
                      children: [
                        Icon(
                          Icons.water_drop_outlined,
                          color: blue,
                          size: 19,
                        ),
                        const SizedBox(width: 7),
                        const Text(
                          "2.1L / 3.0L water",
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 11,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          "70%",
                          style: TextStyle(
                            color: blue,
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 28),

              // ============================================================
              // QUICK ACTIONS
              // ============================================================

              const Text(
                "Quick Actions",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 14),

              Row(
                children: [
                  Expanded(
                    child: _quickAction(
                      icon: Icons.restaurant_menu,
                      title: "Meal Plan",
                      color: orange,
                      onTap: () {},
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: _quickAction(
                      icon: Icons.shopping_basket_outlined,
                      title: "Grocery",
                      color: green,
                      onTap: () {},
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: _quickAction(
                      icon: Icons.fitness_center,
                      title: "Workout",
                      color: purple,
                      onTap: () {},
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: _quickAction(
                      icon: Icons.inventory_2_outlined,
                      title: "Pantry",
                      color: blue,
                      onTap: () {},
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 30),

              // ============================================================
              // RECIPE OF THE DAY
              // ============================================================

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Recipe of the Day",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "Picked for your nutrition goal",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 11,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 11,
                      vertical: 7,
                    ),
                    decoration: BoxDecoration(
                      color: purple.withOpacity(.10),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      "See all",
                      style: TextStyle(
                        color: purple,
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 15),

              // FEATURED RECIPE
              GestureDetector(
                onTap: () {},
                child: Container(
                  height: 315,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(27),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(.30),
                        blurRadius: 20,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(27),
                    child: Stack(
                      children: [
                        // IMAGE
                        Positioned.fill(
                          child: Image.network(
                            "https://images.unsplash.com/photo-1555949258-eb67b1ef0ceb",
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                color: cardColor,
                                child: const Icon(
                                  Icons.restaurant,
                                  color: Colors.grey,
                                  size: 40,
                                ),
                              );
                            },
                          ),
                        ),

                        // GRADIENT
                        Positioned.fill(
                          child: Container(
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                stops: [
                                  0.0,
                                  0.35,
                                  0.72,
                                  1.0,
                                ],
                                colors: [
                                  Colors.black12,
                                  Colors.transparent,
                                  Colors.black54,
                                  Colors.black,
                                ],
                              ),
                            ),
                          ),
                        ),

                        // TODAY'S PICK
                        Positioned(
                          top: 14,
                          left: 14,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 11,
                              vertical: 7,
                            ),
                            decoration: BoxDecoration(
                              color: orange,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.auto_awesome,
                                  color: Colors.white,
                                  size: 13,
                                ),
                                SizedBox(width: 5),
                                Text(
                                  "TODAY'S PICK",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 9,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: .4,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        // BOOKMARK
                        Positioned(
                          top: 14,
                          right: 14,
                          child: Container(
                            height: 42,
                            width: 42,
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(.45),
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.white.withOpacity(.12),
                              ),
                            ),
                            child: const Icon(
                              Icons.bookmark_border_rounded,
                              color: Colors.white,
                              size: 21,
                            ),
                          ),
                        ),

                        // CONTENT
                        Positioned(
                          left: 16,
                          right: 16,
                          bottom: 16,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  _recipePill(
                                    "HIGH PROTEIN",
                                    purple,
                                  ),
                                  const SizedBox(width: 7),
                                  _recipePill(
                                    "FITNESS",
                                    Colors.black.withOpacity(.45),
                                  ),
                                ],
                              ),

                              const SizedBox(height: 9),

                              const Text(
                                "Spicy Garlic Butter\nShrimp Pasta",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 23,
                                  height: 1.08,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              const SizedBox(height: 9),

                              // RATING
                              Row(
                                children: const [
                                  Icon(
                                    Icons.star_rounded,
                                    color: AppColors.yellow,
                                    size: 18,
                                  ),
                                  SizedBox(width: 4),
                                  Text(
                                    "4.8",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(width: 13),
                                  Icon(
                                    Icons.timer_outlined,
                                    color: Colors.white70,
                                    size: 17,
                                  ),
                                  SizedBox(width: 4),
                                  Text(
                                    "32 min",
                                    style: TextStyle(
                                      color: Colors.white70,
                                      fontSize: 11,
                                    ),
                                  ),
                                  SizedBox(width: 13),
                                  Icon(
                                    Icons.local_fire_department_rounded,
                                    color: AppColors.orange,
                                    size: 17,
                                  ),
                                  SizedBox(width: 4),
                                  Text(
                                    "520 kcal",
                                    style: TextStyle(
                                      color: Colors.white70,
                                      fontSize: 11,
                                    ),
                                  ),
                                ],
                              ),

                              const SizedBox(height: 12),

                              // MACROS
                              Row(
                                children: [
                                  _macroPill(
                                    "Protein",
                                    "38g",
                                    purple,
                                  ),
                                  const SizedBox(width: 7),
                                  _macroPill(
                                    "Carbs",
                                    "52g",
                                    orange,
                                  ),
                                  const SizedBox(width: 7),
                                  _macroPill(
                                    "Fat",
                                    "18g",
                                    green,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 18),

              // ============================================================
              // MORE FOR YOU
              // ============================================================

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "More For You",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "View more",
                    style: TextStyle(
                      color: purple,
                      fontSize: 11,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 12),

              SizedBox(
                height: 205,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  children: [
                    _featuredSmallRecipe(
                      image:
                          "https://images.unsplash.com/photo-1547592180-85f173990554",
                      title: "Chicken Power Bowl",
                      calories: "520 kcal",
                      protein: "42g protein",
                      time: "25 min",
                      tag: "MUSCLE",
                      color: purple,
                    ),
                    const SizedBox(width: 12),
                    _featuredSmallRecipe(
                      image:
                          "https://images.unsplash.com/photo-1467003909585-2f8a72700288",
                      title: "Salmon & Rice",
                      calories: "580 kcal",
                      protein: "39g protein",
                      time: "30 min",
                      tag: "LEAN",
                      color: green,
                    ),
                    const SizedBox(width: 12),
                    _featuredSmallRecipe(
                      image:
                          "https://images.unsplash.com/photo-1621996346565-e3dbc646d9a9",
                      title: "Protein Pasta",
                      calories: "490 kcal",
                      protein: "35g protein",
                      time: "20 min",
                      tag: "PROTEIN",
                      color: orange,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              // ============================================================
              // TODAY'S MEALS
              // ============================================================

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Today's Meals",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "View plan",
                    style: TextStyle(
                      color: purple,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 15),

              _mealRow(
                emoji: "🥣",
                meal: "Breakfast",
                title: "Protein Oatmeal",
                info: "420 kcal • 28g protein",
                completed: true,
                color: orange,
              ),

              const SizedBox(height: 9),

              _mealRow(
                emoji: "🍗",
                meal: "Lunch",
                title: "Chicken Rice Bowl",
                info: "580 kcal • 45g protein",
                completed: true,
                color: purple,
              ),

              const SizedBox(height: 9),

              _mealRow(
                emoji: "🥛",
                meal: "Snack",
                title: "Greek Yogurt & Berries",
                info: "220 kcal • 18g protein",
                completed: false,
                color: green,
              ),

              const SizedBox(height: 9),

              _mealRow(
                emoji: "🥩",
                meal: "Dinner",
                title: "Lean Beef & Potatoes",
                info: "610 kcal • 48g protein",
                completed: false,
                color: orange,
              ),

              const SizedBox(height: 30),

              // ============================================================
              // WORKOUT NUTRITION
              // ============================================================

              const Text(
                "Workout Nutrition",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 14),

              Row(
                children: [
                  Expanded(
                    child: _workoutCard(
                      icon: Icons.bolt,
                      title: "Pre-Workout",
                      subtitle: "Energy meals",
                      color: orange,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _workoutCard(
                      icon: Icons.fitness_center,
                      title: "Post-Workout",
                      subtitle: "Protein meals",
                      color: purple,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 30),

              // ============================================================
              // TRENDING RECIPES
              // ============================================================

              const Text(
                "Trending Recipes",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 15),

              SizedBox(
                height: 205,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  children: [
                    _featuredSmallRecipe(
                      image:
                          "https://images.unsplash.com/photo-1525351484163-7529414344d8",
                      title: "Avocado Egg Toast",
                      calories: "380 kcal",
                      protein: "21g protein",
                      time: "15 min",
                      tag: "HEALTHY",
                      color: green,
                    ),
                    const SizedBox(width: 12),
                    _featuredSmallRecipe(
                      image:
                          "https://images.unsplash.com/photo-1546793665-c74683f339c1",
                      title: "Healthy Chicken Salad",
                      calories: "410 kcal",
                      protein: "36g protein",
                      time: "20 min",
                      tag: "LEAN",
                      color: purple,
                    ),
                    const SizedBox(width: 12),
                    _featuredSmallRecipe(
                      image:
                          "https://images.unsplash.com/photo-1490474418585-ba9bad8fd0ea",
                      title: "Berry Protein Bowl",
                      calories: "350 kcal",
                      protein: "25g protein",
                      time: "10 min",
                      tag: "PROTEIN",
                      color: orange,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 35),
            ],
          ),
        ),
      ),
    );
  }

  // ============================================================
  // NUTRITION STAT
  // ============================================================

  Widget _nutritionStat(
    String title,
    String value,
    String target,
    Color color,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 10,
          ),
        ),
        const SizedBox(height: 4),
        Row(
          children: [
            Text(
              value,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              target,
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 9,
              ),
            ),
          ],
        ),
        const SizedBox(height: 5),
        Container(
          height: 4,
          margin: const EdgeInsets.only(right: 10),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(.06),
            borderRadius: BorderRadius.circular(10),
          ),
          child: FractionallySizedBox(
            alignment: Alignment.centerLeft,
            widthFactor: .78,
            child: Container(
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
      ],
    );
  }

  // ============================================================
  // QUICK ACTION
  // ============================================================

  Widget _quickAction({
    required IconData icon,
    required String title,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 14,
          horizontal: 5,
        ),
        decoration: BoxDecoration(
          color: cardColor,
          borderRadius: BorderRadius.circular(17),
        ),
        child: Column(
          children: [
            Container(
              height: 38,
              width: 38,
              decoration: BoxDecoration(
                color: color.withOpacity(.12),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                icon,
                color: color,
                size: 19,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 10,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ============================================================
  // RECIPE PILL
  // ============================================================

  Widget _recipePill(
    String text,
    Color color,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 9,
        vertical: 5,
      ),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 8,
          fontWeight: FontWeight.bold,
          letterSpacing: .3,
        ),
      ),
    );
  }

  // ============================================================
  // MACRO PILL
  // ============================================================

  Widget _macroPill(
    String title,
    String value,
    Color color,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 9,
        vertical: 6,
      ),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(.35),
        borderRadius: BorderRadius.circular(9),
        border: Border.all(
          color: Colors.white.withOpacity(.08),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 5,
            width: 5,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 5),
          Text(
            "$title $value",
            style: const TextStyle(
              color: Colors.white,
              fontSize: 8,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // SMALL RECIPE CARD
  // ============================================================

  Widget _featuredSmallRecipe({
    required String image,
    required String title,
    required String calories,
    required String protein,
    required String time,
    required String tag,
    required Color color,
  }) {
    return Container(
      width: 190,
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.white.withOpacity(.04),
        ),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // IMAGE
          SizedBox(
            height: 115,
            child: Stack(
              children: [
                Positioned.fill(
                  child: Image.network(
                    image,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: Colors.black26,
                        child: const Icon(
                          Icons.restaurant,
                          color: Colors.grey,
                        ),
                      );
                    },
                  ),
                ),

                // TAG
                Positioned(
                  top: 8,
                  left: 8,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 7,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: color,
                      borderRadius: BorderRadius.circular(7),
                    ),
                    child: Text(
                      tag,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 7,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                // BOOKMARK
                Positioned(
                  top: 7,
                  right: 7,
                  child: Container(
                    height: 29,
                    width: 29,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(.5),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.bookmark_border_rounded,
                      color: Colors.white,
                      size: 15,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // DETAILS
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 7),
                Row(
                  children: [
                    Icon(
                      Icons.local_fire_department_outlined,
                      color: orange,
                      size: 13,
                    ),
                    const SizedBox(width: 3),
                    Text(
                      calories,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 9,
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Icon(
                      Icons.timer_outlined,
                      color: Colors.grey,
                      size: 12,
                    ),
                    const SizedBox(width: 3),
                    Text(
                      time,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 9,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                Text(
                  protein,
                  style: TextStyle(
                    color: color,
                    fontSize: 9,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // MEAL ROW
  // ============================================================

  Widget _mealRow({
    required String emoji,
    required String meal,
    required String title,
    required String info,
    required bool completed,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: color.withOpacity(.10),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Center(
              child: Text(
                emoji,
                style: const TextStyle(
                  fontSize: 25,
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  meal,
                  style: TextStyle(
                    color: color,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  info,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
              color: completed
                  ? green.withOpacity(.12)
                  : Colors.white.withOpacity(.05),
              shape: BoxShape.circle,
            ),
            child: Icon(
              completed ? Icons.check : Icons.add,
              color: completed ? green : Colors.grey,
              size: 17,
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // WORKOUT NUTRITION CARD
  // ============================================================

  Widget _workoutCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Container(
            height: 43,
            width: 43,
            decoration: BoxDecoration(
              color: color.withOpacity(.12),
              borderRadius: BorderRadius.circular(13),
            ),
            child: Icon(
              icon,
              color: color,
              size: 21,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 9,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

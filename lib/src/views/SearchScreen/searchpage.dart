import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../theme/app_theme.dart';
import '../../providers/app_state.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> with ThemeColors {
  final TextEditingController searchController = TextEditingController();

  final List<String> goals = [
    "All",
    "💪 Muscle Gain",
    "🔥 Fat Loss",
    "⚖️ Maintain",
    "🥗 Healthy",
  ];

  final List<String> popularIngredients = [
    "🍗 Chicken",
    "🥚 Eggs",
    "🥑 Avocado",
    "🍅 Tomato",
    "🐟 Salmon",
    "🥩 Beef",
    "🍚 Rice",
  ];

  final List<Map<String, dynamic>> nutritionFilters = [
    {
      "title": "High Protein",
      "icon": Icons.fitness_center,
      "color": AppColors.purple,
    },
    {
      "title": "Low Calorie",
      "icon": Icons.local_fire_department_outlined,
      "color": AppColors.orange,
    },
    {
      "title": "Low Carb",
      "icon": Icons.grain,
      "color": AppColors.green,
    },
    {
      "title": "High Fiber",
      "icon": Icons.eco_outlined,
      "color": AppColors.blue,
    },
  ];

  final List<Map<String, dynamic>> recipes = [
    {
      "title": "Creamy Garlic Chicken Pasta",
      "image": "https://images.unsplash.com/photo-1555949258-eb67b1ef0ceb",
      "rating": "4.8",
      "time": "30 min",
      "calories": "520",
      "protein": "42g",
      "carbs": "48g",
      "fat": "18g",
      "tag": "HIGH PROTEIN",
      "color": AppColors.purple,
    },
    {
      "title": "Grilled Chicken Power Bowl",
      "image": "https://images.unsplash.com/photo-1547592180-85f173990554",
      "rating": "4.9",
      "time": "25 min",
      "calories": "480",
      "protein": "46g",
      "carbs": "42g",
      "fat": "14g",
      "tag": "MUSCLE GAIN",
      "color": AppColors.green,
    },
    {
      "title": "Salmon Avocado Rice Bowl",
      "image": "https://images.unsplash.com/photo-1467003909585-2f8a72700288",
      "rating": "4.8",
      "time": "30 min",
      "calories": "560",
      "protein": "39g",
      "carbs": "44g",
      "fat": "21g",
      "tag": "OMEGA 3",
      "color": AppColors.blue,
    },
    {
      "title": "Healthy Chicken Salad",
      "image": "https://images.unsplash.com/photo-1546793665-c74683f339c1",
      "rating": "4.7",
      "time": "20 min",
      "calories": "390",
      "protein": "36g",
      "carbs": "22g",
      "fat": "15g",
      "tag": "LOW CALORIE",
      "color": AppColors.orange,
    },
  ];

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  void performSearch() {
    final query = searchController.text.trim();

    if (query.isEmpty) return;

    context.read<SearchProvider>().performSearch(query);
  }

  void showFilterSheet() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Theme.of(context).cardColor,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(30),
        ),
      ),
      builder: (context) {
        return Consumer<SearchProvider>(
          builder: (context, searchState, child) {
            return Padding(
              padding: const EdgeInsets.fromLTRB(
                20,
                12,
                20,
                30,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      height: 4,
                      width: 45,
                      decoration: BoxDecoration(
                        color: Colors.white24,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Nutrition Filters",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 21,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Reset",
                        style: TextStyle(
                          color: purple,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 22),
                  const Text(
                    "Diet Goal",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      "Muscle Gain",
                      "Fat Loss",
                      "Maintenance",
                      "Healthy Eating",
                    ].map((goal) {
                      final selected = searchState.selectedGoal == goal;

                      return GestureDetector(
                        onTap: () {
                          searchState.setGoal(goal);
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 13,
                            vertical: 10,
                          ),
                          decoration: BoxDecoration(
                            color: selected ? purple : AppColors.background,
                            borderRadius: BorderRadius.circular(14),
                            border: Border.all(
                              color: selected
                                  ? purple
                                  : Colors.white.withOpacity(.06),
                            ),
                          ),
                          child: Text(
                            goal,
                            style: TextStyle(
                              color: selected ? Colors.white : Colors.white70,
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 22),
                  const Text(
                    "Calories",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      _filterValue("Under 400"),
                      const SizedBox(width: 8),
                      _filterValue("400 - 600"),
                      const SizedBox(width: 8),
                      _filterValue("600+"),
                    ],
                  ),
                  const SizedBox(height: 22),
                  const Text(
                    "Diet Type",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      "Vegetarian",
                      "Vegan",
                      "Keto",
                      "Low Carb",
                      "Gluten Free",
                      "High Protein",
                    ].map((type) {
                      return _filterValue(type);
                    }).toList(),
                  ),
                  const SizedBox(height: 25),
                  SizedBox(
                    width: double.infinity,
                    height: 52,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: orange,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(17),
                        ),
                      ),
                      child: const Text(
                        "Apply Filters",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Widget _filterValue(String title) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 9,
      ),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(13),
        border: Border.all(
          color: Colors.white.withOpacity(.06),
        ),
      ),
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.white70,
          fontSize: 10,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final searchState = context.watch<SearchProvider>();

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
                children: [
                  Container(
                    height: 44,
                    width: 44,
                    decoration: BoxDecoration(
                      color: cardColor,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios_new,
                        color: Colors.white,
                        size: 18,
                      ),
                    ),
                  ),
                  const SizedBox(width: 15),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Find Your Food",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 3),
                      Text(
                        "Search recipes & nutrition",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 11,
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 23),

              // ============================================================
              // SEARCH BAR
              // ============================================================

              Container(
                height: 55,
                decoration: BoxDecoration(
                  color: cardColor,
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(
                    color: Colors.white.withOpacity(.05),
                  ),
                ),
                child: Row(
                  children: [
                    const SizedBox(width: 15),
                    const Icon(
                      Icons.search,
                      color: Colors.grey,
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: TextField(
                        controller: searchController,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                        cursorColor: orange,
                        textInputAction: TextInputAction.search,
                        onSubmitted: (_) {
                          performSearch();
                        },
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "Try 'high protein chicken'...",
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 13,
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: performSearch,
                      child: Container(
                        margin: const EdgeInsets.all(6),
                        height: 43,
                        width: 43,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              orange,
                              purple,
                            ],
                          ),
                          borderRadius: BorderRadius.circular(
                            14,
                          ),
                        ),
                        child: const Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // ============================================================
              // GOALS
              // ============================================================

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "What are you working toward?",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Icon(
                    Icons.auto_awesome,
                    color: purple,
                    size: 17,
                  ),
                ],
              ),

              const SizedBox(height: 13),

              SizedBox(
                height: 43,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: goals.length,
                  separatorBuilder: (_, __) => const SizedBox(width: 8),
                  itemBuilder: (context, index) {
                    final selected = searchState.selectedGoal == goals[index];

                    return GestureDetector(
                      onTap: () {
                        searchState.setGoal(goals[index]);
                      },
                      child: AnimatedContainer(
                        duration: const Duration(
                          milliseconds: 200,
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          gradient: selected
                              ? LinearGradient(
                                  colors: [
                                    orange,
                                    purple,
                                  ],
                                )
                              : null,
                          color: selected ? null : cardColor,
                          borderRadius: BorderRadius.circular(
                            15,
                          ),
                          border: Border.all(
                            color: selected
                                ? Colors.transparent
                                : Colors.white.withOpacity(
                                    .06,
                                  ),
                          ),
                        ),
                        child: Text(
                          goals[index],
                          style: TextStyle(
                            color: selected ? Colors.white : Colors.white70,
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 27),

              // ============================================================
              // NUTRITION CATEGORIES
              // ============================================================

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Nutrition Goals",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "View all",
                    style: TextStyle(
                      color: purple,
                      fontSize: 11,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 13),

              SizedBox(
                height: 91,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: nutritionFilters.length,
                  separatorBuilder: (_, __) => const SizedBox(width: 10),
                  itemBuilder: (context, index) {
                    final filter = nutritionFilters[index];

                    return Container(
                      width: 115,
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: cardColor,
                        borderRadius: BorderRadius.circular(
                          17,
                        ),
                        border: Border.all(
                          color: Colors.white.withOpacity(.05),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                              color: filter["color"].withOpacity(.12),
                              borderRadius: BorderRadius.circular(
                                9,
                              ),
                            ),
                            child: Icon(
                              filter["icon"],
                              color: filter["color"],
                              size: 16,
                            ),
                          ),
                          const Spacer(),
                          Text(
                            filter["title"],
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 27),

              // ============================================================
              // POPULAR INGREDIENTS
              // ============================================================

              const Text(
                "Popular Ingredients",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 13),

              SizedBox(
                height: 43,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: popularIngredients.length,
                  separatorBuilder: (_, __) => const SizedBox(width: 9),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        final ingredient = popularIngredients[index];

                        searchController.text = ingredient.substring(2);
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          color: cardColor,
                          borderRadius: BorderRadius.circular(
                            15,
                          ),
                          border: Border.all(
                            color: Colors.white.withOpacity(.05),
                          ),
                        ),
                        child: Text(
                          popularIngredients[index],
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 11,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 27),

              // ============================================================
              // RECENT SEARCHES
              // ============================================================

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Recent Searches",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      searchState.clearRecentSearches();
                    },
                    child: Text(
                      "Clear",
                      style: TextStyle(
                        color: purple,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 12),

              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: searchState.recentSearches.map((search) {
                  return GestureDetector(
                    onTap: () {
                      searchController.text = search;
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 9,
                      ),
                      decoration: BoxDecoration(
                        color: cardColor,
                        borderRadius: BorderRadius.circular(
                          14,
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            Icons.history,
                            color: Colors.grey,
                            size: 15,
                          ),
                          const SizedBox(width: 6),
                          Text(
                            search,
                            style: const TextStyle(
                              color: Colors.white70,
                              fontSize: 11,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),

              const SizedBox(height: 29),

              // ============================================================
              // RESULTS HEADER
              // ============================================================

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Recommended Recipes",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 3),
                      Text(
                        searchState.selectedGoal == "All"
                            ? "Based on your nutrition"
                            : "Based on ${searchState.selectedGoal}",
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: showFilterSheet,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 9,
                      ),
                      decoration: BoxDecoration(
                        color: cardColor,
                        borderRadius: BorderRadius.circular(
                          13,
                        ),
                        border: Border.all(
                          color: Colors.white.withOpacity(.05),
                        ),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.tune,
                            color: purple,
                            size: 17,
                          ),
                          const SizedBox(width: 5),
                          const Text(
                            "Filter",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 15),

              // ============================================================
              // RECIPE CARDS
              // ============================================================

              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: recipes.length,
                separatorBuilder: (_, __) => const SizedBox(height: 13),
                itemBuilder: (context, index) {
                  final recipe = recipes[index];

                  return GestureDetector(
                    onTap: () {
                      // Navigate to Recipe Details
                    },
                    child: Container(
                      height: 145,
                      decoration: BoxDecoration(
                        color: cardColor,
                        borderRadius: BorderRadius.circular(
                          21,
                        ),
                        border: Border.all(
                          color: Colors.white.withOpacity(.04),
                        ),
                      ),
                      clipBehavior: Clip.antiAlias,
                      child: Row(
                        children: [
                          // IMAGE
                          SizedBox(
                            height: 145,
                            width: 128,
                            child: Stack(
                              children: [
                                Positioned.fill(
                                  child: Image.network(
                                    recipe["image"],
                                    fit: BoxFit.cover,
                                    errorBuilder: (
                                      context,
                                      error,
                                      stackTrace,
                                    ) {
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
                                Positioned(
                                  top: 9,
                                  left: 9,
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 7,
                                      vertical: 5,
                                    ),
                                    decoration: BoxDecoration(
                                      color: recipe["color"],
                                      borderRadius: BorderRadius.circular(
                                        7,
                                      ),
                                    ),
                                    child: Text(
                                      recipe["tag"],
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 7,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(width: 12),

                          // DETAILS
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 12,
                                horizontal: 2,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    recipe["title"],
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      height: 1.15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),

                                  const SizedBox(height: 7),

                                  // RATING / TIME
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.star_rounded,
                                        color: AppColors.yellow,
                                        size: 14,
                                      ),
                                      const SizedBox(width: 3),
                                      Text(
                                        recipe["rating"],
                                        style: const TextStyle(
                                          color: Colors.white70,
                                          fontSize: 10,
                                        ),
                                      ),
                                      const SizedBox(width: 9),
                                      const Icon(
                                        Icons.timer_outlined,
                                        color: Colors.grey,
                                        size: 13,
                                      ),
                                      const SizedBox(width: 3),
                                      Text(
                                        recipe["time"],
                                        style: const TextStyle(
                                          color: Colors.white70,
                                          fontSize: 10,
                                        ),
                                      ),
                                    ],
                                  ),

                                  const Spacer(),

                                  // CALORIES
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.local_fire_department_outlined,
                                        color: orange,
                                        size: 14,
                                      ),
                                      const SizedBox(width: 3),
                                      Text(
                                        "${recipe["calories"]} kcal",
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 10,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),

                                  const SizedBox(height: 7),

                                  // MACROS
                                  Row(
                                    children: [
                                      _miniMacro(
                                        "P",
                                        recipe["protein"],
                                        purple,
                                      ),
                                      const SizedBox(width: 5),
                                      _miniMacro(
                                        "C",
                                        recipe["carbs"],
                                        orange,
                                      ),
                                      const SizedBox(width: 5),
                                      _miniMacro(
                                        "F",
                                        recipe["fat"],
                                        green,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),

                          // BOOKMARK
                          Padding(
                            padding: const EdgeInsets.only(
                              right: 10,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const SizedBox(height: 3),
                                Container(
                                  height: 31,
                                  width: 31,
                                  decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(
                                      .25,
                                    ),
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Icon(
                                    Icons.bookmark_border_rounded,
                                    color: Colors.white70,
                                    size: 16,
                                  ),
                                ),
                                const Icon(
                                  Icons.chevron_right,
                                  color: Colors.grey,
                                  size: 20,
                                ),
                                const SizedBox(height: 3),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),

              const SizedBox(height: 35),
            ],
          ),
        ),
      ),
    );
  }

  // ============================================================
  // MINI MACRO
  // ============================================================

  Widget _miniMacro(
    String label,
    String value,
    Color color,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 6,
        vertical: 4,
      ),
      decoration: BoxDecoration(
        color: color.withOpacity(.09),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        "$label $value",
        style: TextStyle(
          color: color,
          fontSize: 8,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

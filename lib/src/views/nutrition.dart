import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/app_state.dart';
import '../../theme/app_theme.dart';

class NutritionPage extends StatefulWidget {
  const NutritionPage({super.key});

  @override
  State<NutritionPage> createState() => _NutritionPageState();
}

class _NutritionPageState extends State<NutritionPage> with ThemeColors {
  final List<String> goals = [
    "Build Muscle",
    "Lose Fat",
    "Maintain",
    "Healthy",
    "Performance",
  ];

  @override
  Widget build(BuildContext context) {
    final nutrition = context.watch<NutritionProvider>();

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
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
                        "Nutrition",
                        style: TextStyle(
                          color: Colors.grey.shade400,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        "Your Diet Plan",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 44,
                    width: 44,
                    decoration: BoxDecoration(
                      color: cardColor,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Icon(
                      Icons.calendar_month_outlined,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 25),

              /// GOAL SELECTOR
              const Text(
                "Your Goal",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 14),

              SizedBox(
                height: 42,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: goals.length,
                  separatorBuilder: (_, __) => const SizedBox(width: 9),
                  itemBuilder: (context, index) {
                    final goal = goals[index];
                    final selected = nutrition.selectedGoal == goal;

                    return GestureDetector(
                      onTap: () {
                        context.read<NutritionProvider>().setGoal(goal);
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15,
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
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: selected
                                ? Colors.transparent
                                : Colors.white.withOpacity(.06),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            goal,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: selected
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 25),

              /// DAILY CALORIE CARD
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      AppColors.darkPanel,
                      cardColor,
                    ],
                  ),
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(
                    color: purple.withOpacity(.15),
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Daily Nutrition",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              "Today's target",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 7,
                          ),
                          decoration: BoxDecoration(
                            color: green.withOpacity(.12),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.trending_up,
                                color: green,
                                size: 16,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                nutrition.selectedGoal,
                                style: TextStyle(
                                  color: green,
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 25),

                    /// CALORIE CIRCLE
                    SizedBox(
                      height: 150,
                      width: 150,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          SizedBox(
                            height: 145,
                            width: 145,
                            child: CircularProgressIndicator(
                              value: .72,
                              strokeWidth: 11,
                              backgroundColor: Colors.white.withOpacity(.06),
                              valueColor: AlwaysStoppedAnimation<Color>(
                                orange,
                              ),
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                "1,840",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 27,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "/ 2,450 kcal",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 11,
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                "610 remaining",
                                style: TextStyle(
                                  color: AppColors.orange,
                                  fontSize: 11,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 25),

                    /// MACROS
                    Row(
                      children: [
                        Expanded(
                          child: _macroItem(
                            "Protein",
                            "132g",
                            "160g",
                            purple,
                            .82,
                          ),
                        ),
                        Expanded(
                          child: _macroItem(
                            "Carbs",
                            "210g",
                            "280g",
                            orange,
                            .75,
                          ),
                        ),
                        Expanded(
                          child: _macroItem(
                            "Fats",
                            "52g",
                            "70g",
                            green,
                            .74,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 25),

              /// WATER
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Hydration",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "2.1 / 3.0 L",
                    style: TextStyle(
                      color: blue,
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 13),

              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: cardColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    Container(
                      height: 48,
                      width: 48,
                      decoration: BoxDecoration(
                        color: blue.withOpacity(.12),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Icon(
                        Icons.water_drop_outlined,
                        color: blue,
                      ),
                    ),
                    const SizedBox(width: 13),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Today's Water",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: LinearProgressIndicator(
                              value: .70,
                              minHeight: 7,
                              backgroundColor: Colors.white.withOpacity(.06),
                              valueColor: AlwaysStoppedAnimation<Color>(
                                blue,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 12),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: 38,
                        width: 38,
                        decoration: BoxDecoration(
                          color: blue.withOpacity(.12),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.add,
                          color: blue,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              /// TODAY'S MEALS
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
                    "See plan",
                    style: TextStyle(
                      color: purple,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 15),

              _mealCard(
                icon: "🥣",
                meal: "Breakfast",
                title: "Protein Oatmeal Bowl",
                calories: "420 kcal",
                protein: "28g protein",
                completed: true,
                color: orange,
              ),

              const SizedBox(height: 10),

              _mealCard(
                icon: "🍗",
                meal: "Lunch",
                title: "Chicken Rice Bowl",
                calories: "580 kcal",
                protein: "45g protein",
                completed: true,
                color: purple,
              ),

              const SizedBox(height: 10),

              _mealCard(
                icon: "🥛",
                meal: "Snack",
                title: "Greek Yogurt & Berries",
                calories: "220 kcal",
                protein: "18g protein",
                completed: false,
                color: green,
              ),

              const SizedBox(height: 10),

              _mealCard(
                icon: "🥩",
                meal: "Dinner",
                title: "Lean Beef & Potatoes",
                calories: "610 kcal",
                protein: "48g protein",
                completed: false,
                color: orange,
              ),

              const SizedBox(height: 30),

              /// WORKOUT NUTRITION
              const Text(
                "Workout Nutrition",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 15),

              Row(
                children: [
                  Expanded(
                    child: _workoutCard(
                      icon: Icons.bolt,
                      title: "Pre-Workout",
                      subtitle: "Energy focused",
                      color: orange,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _workoutCard(
                      icon: Icons.fitness_center,
                      title: "Post-Workout",
                      subtitle: "Recovery focused",
                      color: purple,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 30),

              /// WEEKLY PLAN
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "7 Day Meal Plan",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "View all",
                    style: TextStyle(
                      color: purple,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 15),

              Container(
                padding: const EdgeInsets.all(17),
                decoration: BoxDecoration(
                  color: cardColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    _dayPlan(
                      "MON",
                      "High Protein",
                      "5 meals",
                      true,
                    ),
                    _divider(),
                    _dayPlan(
                      "TUE",
                      "Balanced",
                      "4 meals",
                      true,
                    ),
                    _divider(),
                    _dayPlan(
                      "WED",
                      "High Protein",
                      "5 meals",
                      false,
                    ),
                    _divider(),
                    _dayPlan(
                      "THU",
                      "Performance",
                      "5 meals",
                      false,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              /// DIETARY PREFERENCES
              const Text(
                "Diet Preferences",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 15),

              Container(
                padding: const EdgeInsets.all(17),
                decoration: BoxDecoration(
                  color: cardColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    _preferenceRow(
                      Icons.restaurant_menu,
                      "Diet Type",
                      "Balanced",
                    ),
                    _divider(),
                    _preferenceRow(
                      Icons.no_food_outlined,
                      "Allergies",
                      "None added",
                    ),
                    _divider(),
                    _preferenceRow(
                      Icons.local_fire_department_outlined,
                      "Meal Frequency",
                      "4 meals / day",
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              /// RECOMMENDED RECIPES
              const Text(
                "Recommended For You",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 15),

              SizedBox(
                height: 190,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _recipeCard(
                      "Chicken Power Bowl",
                      "520 kcal",
                      "42g protein",
                      "https://images.unsplash.com/photo-1547592180-85f173990554",
                    ),
                    const SizedBox(width: 12),
                    _recipeCard(
                      "Salmon & Rice",
                      "580 kcal",
                      "39g protein",
                      "https://images.unsplash.com/photo-1467003909585-2f8a72700288",
                    ),
                    const SizedBox(width: 12),
                    _recipeCard(
                      "Protein Pasta",
                      "490 kcal",
                      "35g protein",
                      "https://images.unsplash.com/photo-1621996346565-e3dbc646d9a9",
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              /// GROCERY / PANTRY
              Container(
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      orange.withOpacity(.16),
                      purple.withOpacity(.12),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(22),
                  border: Border.all(
                    color: orange.withOpacity(.12),
                  ),
                ),
                child: Row(
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: orange.withOpacity(.15),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Icon(
                        Icons.shopping_basket_outlined,
                        color: orange,
                      ),
                    ),
                    const SizedBox(width: 13),
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Your Grocery List",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            "12 ingredients needed this week",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 11,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Icon(
                      Icons.chevron_right,
                      color: Colors.grey,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  /// MACRO ITEM
  Widget _macroItem(
    String title,
    String current,
    String target,
    Color color,
    double progress,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 11,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          current,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
        Text(
          "/ $target",
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 9,
          ),
        ),
        const SizedBox(height: 7),
        Padding(
          padding: const EdgeInsets.only(right: 12),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: LinearProgressIndicator(
              value: progress,
              minHeight: 5,
              backgroundColor: Colors.white.withOpacity(.06),
              valueColor: AlwaysStoppedAnimation<Color>(color),
            ),
          ),
        ),
      ],
    );
  }

  /// MEAL CARD
  Widget _mealCard({
    required String icon,
    required String meal,
    required String title,
    required String calories,
    required String protein,
    required bool completed,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.all(13),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(19),
      ),
      child: Row(
        children: [
          Container(
            height: 55,
            width: 55,
            decoration: BoxDecoration(
              color: color.withOpacity(.10),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Center(
              child: Text(
                icon,
                style: const TextStyle(fontSize: 27),
              ),
            ),
          ),
          const SizedBox(width: 13),
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
                const SizedBox(height: 4),
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  "$calories  •  $protein",
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

  /// WORKOUT CARD
  Widget _workoutCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.all(17),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 42,
            width: 42,
            decoration: BoxDecoration(
              color: color.withOpacity(.12),
              borderRadius: BorderRadius.circular(13),
            ),
            child: Icon(
              icon,
              color: color,
            ),
          ),
          const SizedBox(height: 13),
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            subtitle,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 10,
            ),
          ),
        ],
      ),
    );
  }

  /// DAY PLAN
  Widget _dayPlan(
    String day,
    String title,
    String meals,
    bool completed,
  ) {
    return Row(
      children: [
        Container(
          height: 38,
          width: 45,
          decoration: BoxDecoration(
            color: completed
                ? purple.withOpacity(.15)
                : Colors.white.withOpacity(.05),
            borderRadius: BorderRadius.circular(11),
          ),
          child: Center(
            child: Text(
              day,
              style: TextStyle(
                color: completed ? purple : Colors.grey,
                fontSize: 11,
                fontWeight: FontWeight.bold,
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
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 3),
              Text(
                meals,
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 10,
                ),
              ),
            ],
          ),
        ),
        Icon(
          completed ? Icons.check_circle : Icons.chevron_right,
          color: completed ? green : Colors.grey,
          size: 20,
        ),
      ],
    );
  }

  /// PREFERENCE ROW
  Widget _preferenceRow(
    IconData icon,
    String title,
    String value,
  ) {
    return Row(
      children: [
        Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            color: purple.withOpacity(.10),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(
            icon,
            color: purple,
            size: 19,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 3),
              Text(
                value,
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 10,
                ),
              ),
            ],
          ),
        ),
        const Icon(
          Icons.chevron_right,
          color: Colors.grey,
          size: 20,
        ),
      ],
    );
  }

  /// DIVIDER
  Widget _divider() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Divider(
        color: Colors.white.withOpacity(.05),
        height: 1,
      ),
    );
  }

  /// RECIPE CARD
  Widget _recipeCard(
    String title,
    String calories,
    String protein,
    String image,
  ) {
    return Container(
      width: 185,
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(20),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            image,
            height: 105,
            width: double.infinity,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                height: 105,
                color: Colors.black26,
                child: const Icon(
                  Icons.restaurant,
                  color: Colors.grey,
                ),
              );
            },
          ),
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
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  "$calories  •  $protein",
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

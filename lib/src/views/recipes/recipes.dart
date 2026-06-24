import 'package:flutter/material.dart';
import '../../utils/theme/theme.dart';

class RecipesScreen extends StatefulWidget {
  const RecipesScreen({super.key});

  @override
  State<RecipesScreen> createState() => _RecipesScreenState();
}

class _RecipesScreenState extends State<RecipesScreen> {
  final List<Recipe> recipes = [
    Recipe(
      name: 'Grilled Chicken Salad',
      calories: 350,
      protein: 45,
      carbs: 15,
      fats: 12,
      cookTime: 20,
    ),
    Recipe(
      name: 'Protein Smoothie Bowl',
      calories: 320,
      protein: 28,
      carbs: 45,
      fats: 8,
      cookTime: 5,
    ),
    Recipe(
      name: 'Salmon with Vegetables',
      calories: 480,
      protein: 52,
      carbs: 20,
      fats: 18,
      cookTime: 25,
    ),
    Recipe(
      name: 'Oatmeal with Berries',
      calories: 280,
      protein: 12,
      carbs: 48,
      fats: 6,
      cookTime: 10,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.bg1,
      appBar: AppBar(
        title: const Text('Recipes'),
        centerTitle: true,
        backgroundColor: AppTheme.bg2,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Search Bar
            Padding(
              padding: const EdgeInsets.all(16),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search recipes...',
                  prefixIcon:
                      const Icon(Icons.search, color: AppTheme.primaryColor),
                ),
              ),
            ),

            // Filter Chips
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _FilterChip(label: 'High Protein', isSelected: true),
                    const SizedBox(width: 8),
                    _FilterChip(label: 'Low Carb', isSelected: false),
                    const SizedBox(width: 8),
                    _FilterChip(label: 'Quick Meals', isSelected: false),
                    const SizedBox(width: 8),
                    _FilterChip(label: 'Vegetarian', isSelected: false),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Recipe List
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: recipes.length,
              itemBuilder: (context, index) {
                return _RecipeCard(recipe: recipes[index]);
              },
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppTheme.primaryColor,
        onPressed: () {},
        child: const Icon(Icons.add, color: AppTheme.bg1),
      ),
    );
  }
}

class Recipe {
  final String name;
  final int calories;
  final int protein;
  final int carbs;
  final int fats;
  final int cookTime;

  Recipe({
    required this.name,
    required this.calories,
    required this.protein,
    required this.carbs,
    required this.fats,
    required this.cookTime,
  });
}

class _RecipeCard extends StatelessWidget {
  final Recipe recipe;

  const _RecipeCard({required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(recipe.name, style: AppTheme.bodyLarge),
                Icon(Icons.favorite_border, color: AppTheme.primaryColor),
              ],
            ),
            const SizedBox(height: 12),

            // Macro Stats
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _MacroStat(
                  label: 'Protein',
                  value: '${recipe.protein}g',
                  color: const Color(0xFF3B82F6),
                ),
                _MacroStat(
                  label: 'Carbs',
                  value: '${recipe.carbs}g',
                  color: const Color(0xFFFFA500),
                ),
                _MacroStat(
                  label: 'Fats',
                  value: '${recipe.fats}g',
                  color: const Color(0xFFFF6B6B),
                ),
                _MacroStat(
                  label: 'Calories',
                  value: '${recipe.calories}',
                  color: AppTheme.primaryColor,
                ),
              ],
            ),
            const SizedBox(height: 12),

            // Cook Time
            Row(
              children: [
                const Icon(Icons.schedule,
                    size: 16, color: AppTheme.textSecondary),
                const SizedBox(width: 4),
                Text(
                  '${recipe.cookTime} min cook time',
                  style: AppTheme.bodySmall,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _MacroStat extends StatelessWidget {
  final String label;
  final String value;
  final Color color;

  const _MacroStat({
    required this.label,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(value, style: AppTheme.headingSmall.copyWith(color: color)),
        Text(label, style: AppTheme.caption),
      ],
    );
  }
}

class _FilterChip extends StatelessWidget {
  final String label;
  final bool isSelected;

  const _FilterChip({required this.label, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: isSelected ? AppTheme.primaryColor : AppTheme.bg2,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: AppTheme.primaryColor,
          width: isSelected ? 0 : 1,
        ),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: isSelected ? AppTheme.bg1 : AppTheme.textSecondary,
          fontSize: 12,
        ),
      ),
    );
  }
}

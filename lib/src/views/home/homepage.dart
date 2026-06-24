import 'package:flutter/material.dart';
import 'package:MicroMinds/src/utils/theme/theme.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.bg1,
      appBar: AppBar(
        title: const Text('MacroMind'),
        centerTitle: true,
        backgroundColor: AppTheme.bg2,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Welcome Card
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome Back!',
                      style: AppTheme.headingMedium,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Track your fitness and nutrition goals',
                      style: AppTheme.bodySmall,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Quick Stats Section
            Text(
              'Today\'s Stats',
              style: AppTheme.headingSmall,
            ),
            const SizedBox(height: 12),

            // Stats Row 1
            Row(
              children: [
                Expanded(
                  child: _StatCard(
                    icon: Icons.local_fire_department,
                    label: 'Calories',
                    value: '1850',
                    unit: 'kcal',
                    color: const Color(0xFFFF6B6B),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _StatCard(
                    icon: Icons.water_drop,
                    label: 'Water',
                    value: '6',
                    unit: 'glasses',
                    color: const Color(0xFF3B82F6),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),

            // Stats Row 2
            Row(
              children: [
                Expanded(
                  child: _StatCard(
                    icon: Icons.directions_run,
                    label: 'Steps',
                    value: '8,234',
                    unit: 'steps',
                    color: const Color(0xFF00C896),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _StatCard(
                    icon: Icons.fitness_center,
                    label: 'Workouts',
                    value: '1',
                    unit: 'completed',
                    color: const Color(0xFFFFA500),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Quick Actions
            Text(
              'Quick Actions',
              style: AppTheme.headingSmall,
            ),
            const SizedBox(height: 12),

            GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              childAspectRatio: 1.1,
              children: [
                _QuickActionCard(
                  icon: Icons.breakfast_dining,
                  label: 'Log Meal',
                  onTap: () {},
                ),
                _QuickActionCard(
                  icon: Icons.sports_gymnastics,
                  label: 'Log Workout',
                  onTap: () {},
                ),
                _QuickActionCard(
                  icon: Icons.receipt_long,
                  label: 'View Recipes',
                  onTap: () {},
                ),
                _QuickActionCard(
                  icon: Icons.calculate,
                  label: 'Calculator',
                  onTap: () {},
                ),
              ],
            ),
            const SizedBox(height: 24),
            if (_selectedIndex == 0) ...[
              const SizedBox.shrink(),
            ] else if (_selectedIndex == 1) ...[
              _sectionPlaceholder('Diary', 'Open your food and workout diary.'),
            ] else if (_selectedIndex == 2) ...[
              _sectionPlaceholder(
                  'Analytics', 'See charts and progress metrics.'),
            ] else ...[
              _sectionPlaceholder(
                  'Profile', 'Manage account settings and goals.'),
            ],
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        backgroundColor: AppTheme.bg2,
        selectedItemColor: AppTheme.primaryColor,
        unselectedItemColor: AppTheme.textSecondary,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book_outlined),
            activeIcon: Icon(Icons.book),
            label: 'Diary',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.insights_outlined),
            activeIcon: Icon(Icons.insights),
            label: 'Analytics',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            activeIcon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  Widget _sectionPlaceholder(String title, String subtitle) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: AppTheme.headingSmall),
            const SizedBox(height: 8),
            Text(subtitle, style: AppTheme.bodyMedium),
          ],
        ),
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final String unit;
  final Color color;

  const _StatCard({
    required this.icon,
    required this.label,
    required this.value,
    required this.unit,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Icon(icon, color: color, size: 28),
            const SizedBox(height: 8),
            Text(label, style: AppTheme.bodySmall),
            const SizedBox(height: 4),
            Text(value, style: AppTheme.headingSmall),
            Text(unit, style: AppTheme.caption),
          ],
        ),
      ),
    );
  }
}

class _QuickActionCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _QuickActionCard({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: AppTheme.primaryColor, size: 32),
            const SizedBox(height: 8),
            Text(label, style: AppTheme.bodySmall, textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}

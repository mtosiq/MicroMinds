import 'package:flutter/material.dart';
import '../../utils/theme/theme.dart';

class WorkoutsScreen extends StatefulWidget {
  const WorkoutsScreen({super.key});

  @override
  State<WorkoutsScreen> createState() => _WorkoutsScreenState();
}

class _WorkoutsScreenState extends State<WorkoutsScreen> {
  final List<Workout> workouts = [
    Workout(
      name: 'Chest & Triceps',
      exercises: 5,
      duration: 60,
      status: 'Completed',
      icon: Icons.sports_gymnastics,
      color: const Color(0xFFFF6B6B),
    ),
    Workout(
      name: 'Back & Biceps',
      exercises: 6,
      duration: 75,
      status: 'In Progress',
      icon: Icons.fitness_center,
      color: const Color(0xFF3B82F6),
    ),
    Workout(
      name: 'Legs',
      exercises: 7,
      duration: 90,
      status: 'Scheduled',
      icon: Icons.directions_run,
      color: const Color(0xFF00C896),
    ),
    Workout(
      name: 'Shoulders & Arms',
      exercises: 5,
      duration: 55,
      status: 'Completed',
      icon: Icons.sports,
      color: const Color(0xFFFFA500),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.bg1,
      appBar: AppBar(
        title: const Text('Workouts'),
        centerTitle: true,
        backgroundColor: AppTheme.bg2,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Center(
              child: Text(
                'Week 1',
                style: AppTheme.bodyMedium,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Weekly Progress
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('This Week\'s Progress', style: AppTheme.headingSmall),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _ProgressItem(
                          label: 'Completed',
                          value: '2',
                          color: const Color(0xFF00C896),
                        ),
                        _ProgressItem(
                          label: 'In Progress',
                          value: '1',
                          color: const Color(0xFF3B82F6),
                        ),
                        _ProgressItem(
                          label: 'Remaining',
                          value: '1',
                          color: AppTheme.textSecondary,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Current Week Workouts
            Text('Workout Schedule', style: AppTheme.headingSmall),
            const SizedBox(height: 12),

            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: workouts.length,
              itemBuilder: (context, index) {
                return _WorkoutCard(workout: workouts[index]);
              },
            ),
            const SizedBox(height: 16),

            // PRs Section
            Text('Personal Records', style: AppTheme.headingSmall),
            const SizedBox(height: 12),

            Row(
              children: [
                Expanded(
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        children: [
                          const Icon(Icons.trending_up,
                              color: Color(0xFFFF6B6B), size: 28),
                          const SizedBox(height: 8),
                          Text('Bench Press', style: AppTheme.bodySmall),
                          const SizedBox(height: 4),
                          Text('100 kg', style: AppTheme.headingSmall),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        children: [
                          const Icon(Icons.trending_up,
                              color: Color(0xFF3B82F6), size: 28),
                          const SizedBox(height: 8),
                          Text('Deadlift', style: AppTheme.bodySmall),
                          const SizedBox(height: 4),
                          Text('150 kg', style: AppTheme.headingSmall),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
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

class Workout {
  final String name;
  final int exercises;
  final int duration;
  final String status;
  final IconData icon;
  final Color color;

  Workout({
    required this.name,
    required this.exercises,
    required this.duration,
    required this.status,
    required this.icon,
    required this.color,
  });
}

class _WorkoutCard extends StatelessWidget {
  final Workout workout;

  const _WorkoutCard({required this.workout});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: workout.color.withOpacity(0.2),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(workout.icon, color: workout.color),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(workout.name, style: AppTheme.bodyLarge),
                  const SizedBox(height: 4),
                  Text(
                    '${workout.exercises} exercises • ${workout.duration} min',
                    style: AppTheme.bodySmall,
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: _getStatusColor(workout.status).withOpacity(0.2),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                workout.status,
                style: TextStyle(
                  color: _getStatusColor(workout.status),
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case 'Completed':
        return AppTheme.primaryColor;
      case 'In Progress':
        return const Color(0xFF3B82F6);
      case 'Scheduled':
        return AppTheme.textSecondary;
      default:
        return AppTheme.textSecondary;
    }
  }
}

class _ProgressItem extends StatelessWidget {
  final String label;
  final String value;
  final Color color;

  const _ProgressItem({
    required this.label,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(value, style: AppTheme.headingMedium.copyWith(color: color)),
        Text(label, style: AppTheme.bodySmall),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import '../../utils/theme/theme.dart';

class ToolsScreen extends StatefulWidget {
  const ToolsScreen({super.key});

  @override
  State<ToolsScreen> createState() => _ToolsScreenState();
}

class _ToolsScreenState extends State<ToolsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.bg1,
      appBar: AppBar(
        title: const Text('Tools'),
        centerTitle: true,
        backgroundColor: AppTheme.bg2,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Calculator Section
            Text('Macro Calculator', style: AppTheme.headingSmall),
            const SizedBox(height: 12),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Calculate Daily Macros', style: AppTheme.bodyLarge),
                    const SizedBox(height: 16),
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'Weight (kg)',
                        prefixIcon: const Icon(Icons.person,
                            color: AppTheme.primaryColor),
                      ),
                    ),
                    const SizedBox(height: 12),
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'Height (cm)',
                        prefixIcon: const Icon(Icons.straighten,
                            color: AppTheme.primaryColor),
                      ),
                    ),
                    const SizedBox(height: 12),
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'Age',
                        prefixIcon: const Icon(Icons.calendar_today,
                            color: AppTheme.primaryColor),
                      ),
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: const Text('Calculate'),
                      ),
                    ),
                    const SizedBox(height: 16),
                    // Result Card
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: AppTheme.bg2,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        children: [
                          Text('Daily Targets', style: AppTheme.bodyLarge),
                          const SizedBox(height: 12),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              _MacroTarget(
                                label: 'Protein',
                                value: '150g',
                                color: const Color(0xFF3B82F6),
                              ),
                              _MacroTarget(
                                label: 'Carbs',
                                value: '225g',
                                color: const Color(0xFFFFA500),
                              ),
                              _MacroTarget(
                                label: 'Fats',
                                value: '60g',
                                color: const Color(0xFFFF6B6B),
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
            const SizedBox(height: 24),

            // Calendar Section
            Text('3-Month Diet Plan', style: AppTheme.headingSmall),
            const SizedBox(height: 12),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('January - March', style: AppTheme.bodyLarge),
                        const Icon(Icons.calendar_today,
                            color: AppTheme.primaryColor),
                      ],
                    ),
                    const SizedBox(height: 16),

                    // Mini Calendar
                    _MiniCalendar(month: 'January'),
                    const SizedBox(height: 16),
                    _MiniCalendar(month: 'February'),
                    const SizedBox(height: 16),
                    _MiniCalendar(month: 'March'),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Diet Plan Chart
            Text('Progress Chart', style: AppTheme.headingSmall),
            const SizedBox(height: 12),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Weight Progress', style: AppTheme.bodyLarge),
                    const SizedBox(height: 16),

                    // Simple Chart
                    SizedBox(
                      height: 200,
                      child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          // Y-axis labels
                          Positioned(
                            left: 0,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('90kg', style: AppTheme.bodySmall),
                                Text('85kg', style: AppTheme.bodySmall),
                                Text('80kg', style: AppTheme.bodySmall),
                                Text('75kg', style: AppTheme.bodySmall),
                              ],
                            ),
                          ),

                          // Chart bars
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              _ChartBar(height: 0.8, label: 'Week 1'),
                              _ChartBar(height: 0.75, label: 'Week 2'),
                              _ChartBar(height: 0.7, label: 'Week 3'),
                              _ChartBar(height: 0.65, label: 'Week 4'),
                              _ChartBar(height: 0.6, label: 'Week 5'),
                              _ChartBar(height: 0.55, label: 'Week 6'),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Tips Section
            Text('Healthy Tips', style: AppTheme.headingSmall),
            const SizedBox(height: 12),
            _TipCard(
              icon: Icons.local_drink,
              title: 'Stay Hydrated',
              description: 'Drink at least 8-10 glasses of water daily',
            ),
            const SizedBox(height: 12),
            _TipCard(
              icon: Icons.restaurant_menu,
              title: 'Balanced Meals',
              description: 'Combine protein, carbs, and healthy fats',
            ),
            const SizedBox(height: 12),
            _TipCard(
              icon: Icons.bedtime,
              title: 'Get Enough Sleep',
              description: 'Aim for 7-9 hours of quality sleep',
            ),
          ],
        ),
      ),
    );
  }
}

class _MacroTarget extends StatelessWidget {
  final String label;
  final String value;
  final Color color;

  const _MacroTarget({
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

class _MiniCalendar extends StatelessWidget {
  final String month;

  const _MiniCalendar({required this.month});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(month, style: AppTheme.bodyMedium),
        const SizedBox(height: 8),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 7,
            mainAxisSpacing: 4,
            crossAxisSpacing: 4,
          ),
          itemCount: 28,
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                color: index % 2 == 0
                    ? AppTheme.primaryColor.withOpacity(0.3)
                    : AppTheme.bg2,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Center(
                child: Text(
                  '${index + 1}',
                  style: AppTheme.caption,
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}

class _ChartBar extends StatelessWidget {
  final double height;
  final String label;

  const _ChartBar({required this.height, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 25,
          height: 120 * height,
          decoration: BoxDecoration(
            color: AppTheme.primaryColor,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(4),
              topRight: Radius.circular(4),
            ),
          ),
        ),
        const SizedBox(height: 4),
        Text(label, style: AppTheme.caption),
      ],
    );
  }
}

class _TipCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const _TipCard({
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            Icon(icon, color: AppTheme.primaryColor, size: 28),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: AppTheme.bodyLarge),
                  const SizedBox(height: 4),
                  Text(description, style: AppTheme.bodySmall),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

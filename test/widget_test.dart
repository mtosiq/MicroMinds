import 'package:flutter_test/flutter_test.dart';

import 'package:MicroMinds/main.dart';

void main() {
  testWidgets('renders the splash screen', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('NutriChef AI'), findsOneWidget);
    expect(find.text('Personalizing your journey'), findsOneWidget);
  });
}

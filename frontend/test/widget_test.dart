import 'package:flutter_test/flutter_test.dart';
import 'package:daily/main.dart';

void main() {
  testWidgets('App smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const DailyApp());

    // Verify that app launches
    expect(find.text('Daily'), findsOneWidget);
  });
}
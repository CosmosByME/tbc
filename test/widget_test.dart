// Basic widget test for TBS Bank app.
import 'package:flutter_test/flutter_test.dart';
import 'package:tbc/main.dart';

void main() {
  testWidgets('App renders without errors', (WidgetTester tester) async {
    await tester.pumpWidget(const TBSBankApp());
    expect(find.text('TBS Bank'), findsWidgets);
  });
}

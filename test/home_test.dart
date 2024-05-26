import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_testing/app.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('home integration test', () {
    testWidgets('counter increment', (tester) async {
      await tester.pumpWidget(const App());
      final btnIncrement = find.byKey(const ValueKey('home.btn.increment'));
      await tester.tap(btnIncrement);
      await tester.pumpAndSettle();
      expect(find.text('1'), findsOneWidget);
    });
  });
}

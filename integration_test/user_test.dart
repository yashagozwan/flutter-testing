import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_testing/app.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('User Feature', () {
    testWidgets('show users', (tester) async {
      await tester.pumpWidget(const App());
      await tester.pumpAndSettle();
      expect(find.text('George Bluth'), findsOneWidget);
    });
  });
}

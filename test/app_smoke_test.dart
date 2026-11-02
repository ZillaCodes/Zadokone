import 'package:flutter_test/flutter_test.dart';
import 'package:zadok_one/main.dart';

void main() {
  testWidgets('welcome screen renders and navigates to sign in', (tester) async {
    await tester.pumpWidget(const ZadokOneApp());
    await tester.pumpAndSettle();

    expect(find.text('Your Journey to'), findsOneWidget);
    expect(find.text('Homeownership'), findsOneWidget);

    await tester.tap(find.text('Get Started'));
    await tester.pumpAndSettle();

    expect(find.text('Welcome Back'), findsOneWidget);
  });
}

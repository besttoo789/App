import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:v_1/main.dart'; // Update the path as necessary

void main() {
  testWidgets('Login page widget test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that the username and password fields are present.
    expect(
        find.byType(TextField), findsNWidgets(2)); // Expecting two TextFields
    expect(find.text('Username'), findsOneWidget);
    expect(find.text('Password'), findsOneWidget);
    expect(find.text('Login'), findsOneWidget);
    expect(find.text('REGISTER'), findsOneWidget);

    // Enter text in the username and password fields.
    await tester.enterText(find.byType(TextField).at(0), 'testuser');
    await tester.enterText(find.byType(TextField).at(1), 'password');

    // Tap the login button.
    await tester.tap(find.text('Login'));
    await tester.pump();

    // Verify that an action occurred (e.g., a snackbar message).
    // You will need to implement the snackbar or other feedback logic in your app for this to work.
    expect(find.byType(SnackBar), findsOneWidget);
    expect(find.text('Please enter username and password'), findsOneWidget);
  });
}

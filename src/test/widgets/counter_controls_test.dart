
import 'package:flutter_test/flutter_test.dart';
import 'package:counter_app/widgets/counter_controls.dart';
import 'package:flutter/material.dart';

void main() {
	group('CounterControls Widget Tests', () {
		testWidgets('CounterControls should have an increment button', (WidgetTester tester) async {
			// Arrange
			await tester.pumpWidget(MaterialApp(home: Scaffold(body: CounterControls())));

			// Act
			final incrementButtonFinder = find.byIcon(Icons.add);

			// Assert
			expect(incrementButtonFinder, findsOneWidget);
		});

		testWidgets('CounterControls should have a decrement button', (WidgetTester tester) async {
			// Arrange
			await tester.pumpWidget(MaterialApp(home: Scaffold(body: CounterControls())));

			// Act
			final decrementButtonFinder = find.byIcon(Icons.remove);

			// Assert
			expect(decrementButtonFinder, findsOneWidget);
		});
	});
}

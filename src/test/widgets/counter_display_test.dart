
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:counter_app/widgets/counter_display.dart';
import 'package:counter_app/cubits/counter_cubit.dart';

void main() {
	group('CounterDisplay Widget Tests', () {
		testWidgets('Displays the initial counter value', (WidgetTester tester) async {
			// Provide a CounterCubit with an initial state for testing
			await tester.pumpWidget(
				MaterialApp(
					home: BlocProvider<CounterCubit>(
						create: (_) => CounterCubit(),
						child: const CounterDisplay(),
					),
				),
			);

			// Expect the initial value to be displayed
			expect(find.text('0'), findsOneWidget);
		});

		testWidgets('Displays updated counter value after increment', (WidgetTester tester) async {
			final counterCubit = CounterCubit();

			// Provide a CounterCubit for testing
			await tester.pumpWidget(
				MaterialApp(
					home: BlocProvider<CounterCubit>(
						create: (_) => counterCubit,
						child: const CounterDisplay(),
					),
				),
			);

			// Increment the counter
			counterCubit.increment();
			await tester.pump();

			// Expect the updated value to be displayed
			expect(find.text('1'), findsOneWidget);
		});

		testWidgets('Displays updated counter value after decrement', (WidgetTester tester) async {
			final counterCubit = CounterCubit()..increment(); // Start with value 1

			// Provide a CounterCubit for testing
			await tester.pumpWidget(
				MaterialApp(
					home: BlocProvider<CounterCubit>(
						create: (_) => counterCubit,
						child: const CounterDisplay(),
					),
				),
			);

			// Decrement the counter
			counterCubit.decrement();
			await tester.pump();

			// Expect the updated value to be displayed
			expect(find.text('0'), findsOneWidget);
		});
	});
}

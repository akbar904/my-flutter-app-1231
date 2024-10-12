
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:com.example.counter_app/screens/home_screen.dart';

// Mocking the CounterCubit used in HomeScreen
class MockCounterCubit extends MockCubit<int> implements CounterCubit {}

void main() {
	group('HomeScreen', () {
		late MockCounterCubit mockCounterCubit;

		setUp(() {
			mockCounterCubit = MockCounterCubit();
		});

		testWidgets('renders CounterDisplay with initial counter value', (WidgetTester tester) async {
			when(() => mockCounterCubit.state).thenReturn(0);

			await tester.pumpWidget(
				MaterialApp(
					home: BlocProvider.value(
						value: mockCounterCubit,
						child: HomeScreen(),
					),
				),
			);

			expect(find.text('0'), findsOneWidget);
		});

		testWidgets('renders increment and decrement buttons', (WidgetTester tester) async {
			when(() => mockCounterCubit.state).thenReturn(0);

			await tester.pumpWidget(
				MaterialApp(
					home: BlocProvider.value(
						value: mockCounterCubit,
						child: HomeScreen(),
					),
				),
			);

			expect(find.byIcon(Icons.add), findsOneWidget);
			expect(find.byIcon(Icons.remove), findsOneWidget);
		});

		testWidgets('tapping increment button invokes cubit.increment', (WidgetTester tester) async {
			when(() => mockCounterCubit.state).thenReturn(0);

			await tester.pumpWidget(
				MaterialApp(
					home: BlocProvider.value(
						value: mockCounterCubit,
						child: HomeScreen(),
					),
				),
			);

			await tester.tap(find.byIcon(Icons.add));
			verify(() => mockCounterCubit.increment()).called(1);
		});

		testWidgets('tapping decrement button invokes cubit.decrement', (WidgetTester tester) async {
			when(() => mockCounterCubit.state).thenReturn(0);

			await tester.pumpWidget(
				MaterialApp(
					home: BlocProvider.value(
						value: mockCounterCubit,
						child: HomeScreen(),
					),
				),
			);

			await tester.tap(find.byIcon(Icons.remove));
			verify(() => mockCounterCubit.decrement()).called(1);
		});
	});
}

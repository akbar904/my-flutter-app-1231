
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:counter_app/cubits/counter_cubit.dart';

void main() {
	group('CounterCubit', () {
		blocTest<CounterCubit, int>(
			'emits [1] when increment is called on initial state 0',
			build: () => CounterCubit(),
			act: (cubit) => cubit.increment(),
			expect: () => [1],
		);

		blocTest<CounterCubit, int>(
			'emits [-1] when decrement is called on initial state 0',
			build: () => CounterCubit(),
			act: (cubit) => cubit.decrement(),
			expect: () => [-1],
		);

		blocTest<CounterCubit, int>(
			'emits [1, 2] when increment is called twice',
			build: () => CounterCubit(),
			act: (cubit) {
				cubit.increment();
				cubit.increment();
			},
			expect: () => [1, 2],
		);

		blocTest<CounterCubit, int>(
			'emits [-1, -2] when decrement is called twice',
			build: () => CounterCubit(),
			act: (cubit) {
				cubit.decrement();
				cubit.decrement();
			},
			expect: () => [-1, -2],
		);

		blocTest<CounterCubit, int>(
			'emits [1, 0] when increment and then decrement is called',
			build: () => CounterCubit(),
			act: (cubit) {
				cubit.increment();
				cubit.decrement();
			},
			expect: () => [1, 0],
		);

		blocTest<CounterCubit, int>(
			'emits [-1, 0] when decrement and then increment is called',
			build: () => CounterCubit(),
			act: (cubit) {
				cubit.decrement();
				cubit.increment();
			},
			expect: () => [-1, 0],
		);
	});
}

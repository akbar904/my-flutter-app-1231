
import 'package:flutter_test/flutter_test.dart';
import 'package:counter_app/models/counter_state.dart';

void main() {
	group('CounterState', () {
		test('should have a counterValue', () {
			final counterState = CounterState(counterValue: 0);
			expect(counterState.counterValue, isA<int>());
		});

		test('should initialize with given counterValue', () {
			final counterState = CounterState(counterValue: 5);
			expect(counterState.counterValue, 5);
		});
	});
}

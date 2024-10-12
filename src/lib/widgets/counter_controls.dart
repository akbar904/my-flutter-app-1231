
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubits/counter_cubit.dart';

class CounterControls extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return Row(
			mainAxisAlignment: MainAxisAlignment.center,
			children: <Widget>[
				IconButton(
					icon: Icon(Icons.remove),
					onPressed: () => context.read<CounterCubit>().decrement(),
				),
				IconButton(
					icon: Icon(Icons.add),
					onPressed: () => context.read<CounterCubit>().increment(),
				),
			],
		);
	}
}


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:com.example.counter_app/cubits/counter_cubit.dart';
import 'package:com.example.counter_app/widgets/counter_display.dart';
import 'package:com.example.counter_app/widgets/counter_controls.dart';

class HomeScreen extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				title: Text('Counter App'),
			),
			body: Center(
				child: Column(
					mainAxisAlignment: MainAxisAlignment.center,
					children: <Widget>[
						BlocBuilder<CounterCubit, int>(
							builder: (context, state) {
								return CounterDisplay(counterValue: state);
							},
						),
						CounterControls(),
					],
				),
			),
		);
	}
}

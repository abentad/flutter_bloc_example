import 'package:bloc_example/presentation/screens/home_screen.dart';
import 'package:bloc_example/presentation/screens/second_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'logic/cubit/counter_cubit.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterCubit(),
      child: MaterialApp(
        title: 'Bloc Example',
        theme: ThemeData(primarySwatch: Colors.teal),
        routes: {
          "/": (context) => MyHomePage(title: "Bloc Example", color: Colors.orange),
          "/second": (context) => SecondScreen(title: "Second screen", color: Colors.red),
          //  "/": (context) => BlocProvider.value(value: _counterCubit, child: MyHomePage(title: "Bloc Example", color: Colors.orange)),
          // "/second": (context) => BlocProvider.value(value: _counterCubit, child: SecondScreen(title: "Second screen", color: Colors.red)),
        },
      ),
    );
  }
}

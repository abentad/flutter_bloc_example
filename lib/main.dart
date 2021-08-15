import 'package:bloc_example/logic/cubit/internet_cubit.dart';
import 'package:bloc_example/presentation/screens/home_screen.dart';
import 'package:bloc_example/presentation/screens/second_screen.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'logic/cubit/counter_cubit.dart';

void main() {
  runApp(MyApp(connectivity: Connectivity()));
}

class MyApp extends StatelessWidget {
  final Connectivity connectivity;

  MyApp({required this.connectivity});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<InternetCubit>(create: (context) => InternetCubit(connectivity: connectivity)),
        BlocProvider<CounterCubit>(create: (context) => CounterCubit(internetCubit: BlocProvider.of<InternetCubit>(context))),
      ],
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

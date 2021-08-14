import 'package:bloc_example/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
        home: MyHomePage(title: 'Bloc Example'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('You have pushed the button this many times:', style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500)),
            BlocConsumer<CounterCubit, CounterState>(
              listener: (context, state) {
                if (state.wasIncremented == true) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Incremented"), duration: Duration(seconds: 2)));
                } else if (state.wasIncremented == false) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Decremented"), duration: Duration(seconds: 2)));
                }
              },
              builder: (context, state) {
                return Text(state.counterValue.toString(), style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w600));
              },
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(onPressed: () => BlocProvider.of<CounterCubit>(context).decrement(), child: Icon(Icons.remove, size: 32.0)),
                SizedBox(width: 20),
                FloatingActionButton(onPressed: () => BlocProvider.of<CounterCubit>(context).increment(), child: Icon(Icons.add, size: 32.0))
              ],
            )
          ],
        ),
      ),
    );
  }
}

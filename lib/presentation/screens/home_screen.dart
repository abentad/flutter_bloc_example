import 'package:bloc_example/constants/enums.dart';
import 'package:bloc_example/logic/cubit/counter_cubit.dart';
import 'package:bloc_example/logic/cubit/internet_cubit.dart';
import 'package:bloc_example/presentation/screens/second_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title, required this.color}) : super(key: key);

  final String title;
  final Color color;

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
            BlocBuilder<InternetCubit, InternetState>(
              builder: (context, state) {
                if (state is InternetConnected && state.connectionType == ConnectionType.Wifi) {
                  return Text("Wifi");
                } else if (state is InternetConnected && state.connectionType == ConnectionType.Mobile) {
                  return Text("Mobile");
                } else if (state is InternetDisconnected) {
                  return Text("No Internet");
                }
                return CircularProgressIndicator();
              },
            ),
            // Text('You have pushed the button this many times:', style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500, color: widget.color)),
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
            // SizedBox(height: 20.0),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     IconButton(onPressed: () => BlocProvider.of<CounterCubit>(context).decrement(), icon: Icon(Icons.remove, size: 32.0), color: widget.color),
            //     SizedBox(width: 20),
            //     IconButton(onPressed: () => BlocProvider.of<CounterCubit>(context).increment(), icon: Icon(Icons.add, size: 32.0), color: widget.color),
            //   ],
            // ),
            MaterialButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/second');
              },
              child: Text("Go to second screen"),
              color: widget.color,
            ),
          ],
        ),
      ),
    );
  }
}

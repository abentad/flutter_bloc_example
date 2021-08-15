import 'package:bloc_example/logic/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({Key? key, required this.title, required this.color}) : super(key: key);

  final String title;
  final Color color;

  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
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
            Text('You have pushed the button this many times:', style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500, color: widget.color)),
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
                IconButton(onPressed: () => BlocProvider.of<CounterCubit>(context).decrement(), icon: Icon(Icons.remove, size: 32.0), color: widget.color),
                SizedBox(width: 20),
                IconButton(onPressed: () => BlocProvider.of<CounterCubit>(context).increment(), icon: Icon(Icons.add, size: 32.0), color: widget.color),
              ],
            ),
            MaterialButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Go back to home screen"),
              color: widget.color,
            ),
          ],
        ),
      ),
    );
  }
}

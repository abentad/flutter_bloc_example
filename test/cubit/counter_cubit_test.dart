import 'package:bloc_example/logic/cubit/counter_cubit.dart';
import 'package:test/test.dart';

void main() {
  group("CounterCubit", () {
    late CounterCubit counterCubit;
    setUp(() {
      counterCubit = CounterCubit();
    });
    tearDown(() {
      counterCubit.close();
    });

    //for testing the initial value of counter value
    test("The initial state of CounterCubit is CounterState(counterValue:0)", () {
      expect(counterCubit.state, CounterState(counterValue: 0, wasIncremented: false));
    });

    //for testing the increment method inside teh CounterCubit
    // blocTest(
    //   "The cubit should emit a CounterState(counterValue:1, wasIncremented: true) when cubit.increment() function is called",
    //   build: () => counterCubit,
    //   act: (cubit) => cubit!.increment(),
    //   expect: () {
    //     CounterState(counterValue: 1, wasIncremented: true);
    //   },
    // );
  });
}

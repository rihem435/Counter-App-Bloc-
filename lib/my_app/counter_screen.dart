import 'package:app/my_app/counter_cubit.dart';
import 'package:app/my_app/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //blocProvider create cubit
    return BlocProvider(
      create: (context) => CounterCubit(),
      //create blocConsumer pour utiliser bloc
      child: BlocConsumer<CounterCubit, CounterStates>(
          builder: (context, state) {
            //appel get dans builder
            var cubit = CounterCubit.get(context);
            return Scaffold(
              body: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      //  flex: 2,
                      child: ElevatedButton(
                        onPressed: () {
                          cubit.increaseNumber();
                          print(cubit.number);
                        },
                        style: ElevatedButton.styleFrom(
                            shape: CircleBorder(), padding: EdgeInsets.all(25)),
                        child: Icon(Icons.add),
                      ),
                    ),
                    Text(
                      "${cubit.number}",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
                    ),
                    Expanded(
                      ///   flex: 2,
                      child: ElevatedButton(
                        onPressed: () {
                          cubit.decreaseNumber();
                          print(cubit.number);
                        },
                        style: ElevatedButton.styleFrom(
                            shape: CircleBorder(), padding: EdgeInsets.all(25)),
                        child: Icon(Icons.remove),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
          listener: (BuildContext context, state) {}),
    );
  }
}

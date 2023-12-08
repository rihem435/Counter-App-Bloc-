import 'package:app/my_app/states.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter/material.dart';

class CounterCubit extends Cubit<CounterStates> {
  //pass initstate to super
  CounterCubit() : super(CounterInitState());
  //create function to get object from the cubit
  //static appele b name class
  static CounterCubit get(BuildContext context) {
    return BlocProvider.of(context);
  }

  //create var and functions
  int number = 0;
  void increaseNumber() {
    number++;
    emit(CounterIncreaseNumber());
  }

  void decreaseNumber() {
    number--;
    emit(CounterDecreaseNumber());
  }
}

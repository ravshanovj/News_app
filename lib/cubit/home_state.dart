import 'package:bloc/bloc.dart';
import 'package:newsapp/data/model/model.dart';
import 'package:newsapp/data/service/get_service.dart';

part 'home_cubit.dart';
abstract class HomeState {
  HomeState();
}

class HomeInitialState extends HomeState {
  HomeInitialState();
}

class HomeLoadingState extends HomeState {
  HomeLoadingState();
}

class HomeErrorState extends HomeState {
  String error;
  HomeErrorState(this.error);
}

class HomeCompleteState extends HomeState {
  List<Course> users;
  HomeCompleteState(this.users);
}

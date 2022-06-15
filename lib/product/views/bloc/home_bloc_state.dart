part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {
  HomeLoading();
}

class HomeComplated extends HomeState {
  List<UserModel> users;

  HomeComplated(this.users);
}

class CubitError extends HomeState {
  String errMessasge;

  CubitError(this.errMessasge);
}

part of 'home_cubit.dart';

@immutable
abstract class CubitState {
  const CubitState();
}

class CubitInitial extends CubitState {
  const CubitInitial();
}

class CubitLoading extends CubitState {
  const CubitLoading();
}

class CubitComplated extends CubitState {
  List<UserModel> users;

  CubitComplated(this.users);
}

class CubitError extends CubitState {
  String errMessasge;

  CubitError(this.errMessasge);
}

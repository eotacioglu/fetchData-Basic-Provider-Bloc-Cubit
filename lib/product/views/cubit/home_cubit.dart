import 'package:bloc/bloc.dart';
import 'package:getdata/product/models/userModel/user.dart';
import 'package:getdata/product/views/cubit/ICubitService.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<CubitState> {
  final ICubitService cubitService;

  HomeCubit(this.cubitService) : super(const CubitInitial()) {
    fetchData();
  }

  Future<void> fetchData() async {
    emit(const CubitLoading());
    final result = await cubitService.getUserData();

    try {
      if (result.isNotEmpty) {
        emit(CubitComplated(result));
      }
    } catch (e) {
      emit(CubitError(e.toString()));
    }
  }
}

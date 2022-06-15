import 'package:bloc/bloc.dart';
import 'package:getdata/product/models/userModel/user.dart';
import 'package:getdata/product/services/IGetDataService.dart';
import 'package:meta/meta.dart';

part 'home_bloc_event.dart';
part 'home_bloc_state.dart';

class HomeBloc extends Bloc<GetDataEvent, HomeState> {
  final IGetDataService cubitService;
  HomeBloc(this.cubitService) : super(HomeInitial()) {
    on<GetDataEvent>((event, emit) async {
      final result = await cubitService.getUserData();

      emit(HomeLoading());

      try {
        if (result.isNotEmpty) {
          emit(HomeComplated(result));
        }
      } catch (e) {
        emit(CubitError(e.toString()));
      }
    });
  }
}

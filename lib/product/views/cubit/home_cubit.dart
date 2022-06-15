import 'package:bloc/bloc.dart';
import 'package:getdata/product/models/userModel/user.dart';
import 'package:getdata/product/services/IGetDataService.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<CubitState> {
  final IGetDataService cubitService;

  HomeCubit(this.cubitService) : super(const CubitInitial()) {
    
    // Cubit serivisinini çalışması için herhangi bir manuel tetikleyici kullanmamak adına fonksiyon Cubit servisinin constructor kısmında çalıştırılmıştır.
    
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

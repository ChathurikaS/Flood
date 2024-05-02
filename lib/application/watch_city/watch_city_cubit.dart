import 'package:flutter_application_1/domain/city/city.dart';
import 'package:flutter_application_1/domain/city/i_city_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class WatchCityCubit extends Cubit<City?> {
  final ICityRepo _cityRepo;
  WatchCityCubit(this._cityRepo) : super(null);

  Future<void> watch(String id) async {
    _cityRepo.watchCity(id).listen((city) {
      emit(city);
    });
  }
}

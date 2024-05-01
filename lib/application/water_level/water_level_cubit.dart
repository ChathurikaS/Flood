// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'package:flutter_application_1/domain/water_level/i_water_level_repo.dart';

@injectable
class WaterLevelCubit extends Cubit<int> {
  final IWaterLevelRepo _waterLevelRepo;
  WaterLevelCubit(
    this._waterLevelRepo,
  ) : super(-1);

  void watchWaterLevel(String cityId) {
    _waterLevelRepo.watchWaterLevel(cityId).listen((event) {
      emit(event);
    });
  }
}

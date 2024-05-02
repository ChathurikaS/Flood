import 'package:flutter_application_1/domain/flood/i_flood_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class FloodLevelCubit extends Cubit<int> {
  final IFloodRepo _floodRepo;
  FloodLevelCubit(this._floodRepo) : super(0);

  void watchFlood(String cityId) {
    _floodRepo.watchFlood(cityId).listen((floodLevel) {
      emit(floodLevel);
    });
  }
}

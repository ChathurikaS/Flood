import 'package:flutter_application_1/domain/city/city.dart';
import 'package:flutter_application_1/domain/city/i_city_repo.dart';
import 'package:flutter_application_1/domain/failure/failure.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'update_rainfall_state.dart';
part 'update_rainfall_cubit.freezed.dart';

@injectable
class UpdateRainfallCubit extends Cubit<UpdateRainfallState> {
  final ICityRepo _cityRepo;
  UpdateRainfallCubit(this._cityRepo)
      : super(const UpdateRainfallState.initial());

  Future<void> update(City city) async {
    emit(const UpdateRainfallState.loading());
    final failureOrSuccess = await _cityRepo.update(city);
    failureOrSuccess.fold(
      (failure) => emit(UpdateRainfallState.failed(failure)),
      (_) => emit(const UpdateRainfallState.succeed()),
    );
  }
}

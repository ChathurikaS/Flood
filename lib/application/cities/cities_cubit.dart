import 'package:flutter_application_1/core/extensions/dartz_x.dart';
import 'package:flutter_application_1/domain/city/city.dart';
import 'package:flutter_application_1/domain/city/i_city_repo.dart';
import 'package:flutter_application_1/domain/failure/failure.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'cities_state.dart';
part 'cities_cubit.freezed.dart';

@injectable
class CitiesCubit extends Cubit<CitiesState> {
  final ICityRepo _cityRepo;
  CitiesCubit(this._cityRepo) : super(const CitiesState.loading());

  Future<void> load() async {
    emit(const CitiesState.loading());
    final failureOrCities = await _cityRepo.getAll();
    if (failureOrCities.isLeft()) {
      emit(CitiesState.failed(failureOrCities.getLeft()));
    }
    emit(CitiesState.loaded(failureOrCities.getOrCrash()));
  }
}

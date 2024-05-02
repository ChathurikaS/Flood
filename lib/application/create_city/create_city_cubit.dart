import 'package:flutter_application_1/core/extensions/dartz_x.dart';
import 'package:flutter_application_1/domain/city/i_city_repo.dart';
import 'package:flutter_application_1/domain/failure/failure.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'create_city_state.dart';
part 'create_city_cubit.freezed.dart';

@injectable
class CreateCityCubit extends Cubit<CreateCityState> {
  final ICityRepo _cityRepo;
  CreateCityCubit(this._cityRepo) : super(const CreateCityState.initial());

  Future<void> create(String name) async {
    emit(const CreateCityState.loading());
    final failureOrNone = await _cityRepo.create(name);

    if (failureOrNone.isLeft()) {
      emit(CreateCityState.failed(failureOrNone.getLeft()));
      return;
    }

    emit(const CreateCityState.succeed());
  }
}

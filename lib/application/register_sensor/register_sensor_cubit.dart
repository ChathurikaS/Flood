import 'package:flutter_application_1/core/extensions/dartz_x.dart';
import 'package:flutter_application_1/domain/city/city.dart';
import 'package:flutter_application_1/domain/city/i_city_repo.dart';
import 'package:flutter_application_1/domain/failure/failure.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'register_sensor_state.dart';
part 'register_sensor_cubit.freezed.dart';

@injectable
class RegisterSensorCubit extends Cubit<RegisterSensorState> {
  final ICityRepo _cityRepo;
  RegisterSensorCubit(this._cityRepo)
      : super(const RegisterSensorState.initial());

  Future<void> registerSensor(City city) async {
    emit(const RegisterSensorState.loading());
    final code = await FlutterBarcodeScanner.scanBarcode(
        '#ff6666', 'Cancel', true, ScanMode.QR);
    if (code == '-1') {
      emit(const RegisterSensorState.failed(Failure(message: "Cancelled")));
      return;
    }
    final failureOrNone = await _cityRepo.update(city.copyWith(sensor: code));
    if (failureOrNone.isLeft()) {
      emit(RegisterSensorState.failed(failureOrNone.getLeft()));
      return;
    }
    emit(const RegisterSensorState.succeed());
  }
}

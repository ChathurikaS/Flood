import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';

@injectable
class DateCubit extends Cubit<String> {
  DateCubit() : super("");

  Timer? _timer;

  void start() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      DateTime now = DateTime.now();
      String formattedDate = DateFormat('EEEE, d MMMM').format(now);
      emit(formattedDate);
    });
  }

  @override
  Future<void> close() {
    if (_timer != null) {
      _timer?.cancel();
    }
    return super.close();
  }
}

import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/application/cubit/date_cubit.dart';
import 'package:flutter_application_1/injection.dart';
import 'package:flutter_application_1/presentation/widgets/text.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DateView extends StatelessWidget {
  const DateView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<DateCubit>()..start(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: BlocBuilder<DateCubit, String>(
          builder: (context, state) {
            return TextMedium(state);
          },
        ),
      ),
    );
  }
}

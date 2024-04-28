// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_application_1/domain/weather/forecast/forecast.dart';
import 'package:flutter_application_1/presentation/core/theme.dart';
import 'package:flutter_application_1/presentation/widgets/space.dart';
import 'package:flutter_application_1/presentation/widgets/text.dart';

class WetherDayCard extends StatelessWidget {
  final bool isFirst;
  final bool isLast;
  final Forecast forecast;

  const WetherDayCard(
      {super.key,
      this.isFirst = false,
      this.isLast = false,
      required this.forecast});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: EdgeInsets.only(
          right: isLast ? 20 : 12, left: isFirst ? 20 : 0, bottom: 22),
      child: SizedBox(
        width: 100,
        height: 128,
        child: Material(
          color: isFirst ? const Color(0xFF7A95AE) : theme.backgroundLight,
          shape: RoundedRectangleBorder(
            side: !isFirst
                ? const BorderSide(color: Colors.white, width: 1)
                : BorderSide.none,
            borderRadius: BorderRadius.circular(8),
          ),
          elevation: 12,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextRegular(
                forecast.day,
                color: isFirst ? Colors.white : const Color(0xFF7A95AE),
              ),
              const VGap(gap: 4),
              Image.asset(
                "assets/icons/weather/${forecast.icon}.png",
                width: 50,
                fit: BoxFit.fitWidth,
              ),
              const VGap(gap: 4),
              TextRegular(
                forecast.temp,
                color: isFirst ? Colors.white : const Color(0xFF7A95AE),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

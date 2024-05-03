import 'package:flutter/material.dart';
import 'package:flutter_application_1/application/flood_level/flood_level_cubit.dart';
import 'package:flutter_application_1/domain/city/city.dart';
import 'package:flutter_application_1/injection.dart';
import 'package:flutter_application_1/presentation/widgets/space.dart';
import 'package:flutter_application_1/presentation/widgets/text.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FloodLevel extends StatelessWidget {
  final City city;

  const FloodLevel({super.key, required this.city});

  (Color, Color) _getColors(int state) {
    if (state < 50) {
      return (const Color(0xFF1BC8D3), const Color(0xFFBFFBFF));
    } else if (state < 80) {
      return (const Color(0xFFBCBE5B), const Color(0xFFF8FA9E));
    } else {
      return (const Color(0xFFCF765A), const Color(0xFFFFC3B0));
    }
  }

  String _getText(int state) {
    if (state < 50) {
      return "Normal";
    } else if (state < 100) {
      return "Warning";
    } else {
      return "Danger";
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<FloodLevelCubit>()..watchFlood(city.sensor),
      child: BlocBuilder<FloodLevelCubit, int>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Material(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 20,
              shadowColor: Colors.black.withOpacity(0.2),
              child: Material(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                color: _getColors(state).$1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(20),
                      child: TextLarge("Flood Status", color: Colors.white),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: SizedBox(
                            width: 140,
                            height: 140,
                            child: ClipOval(
                              child: Container(
                                color: Colors.white,
                                child: Stack(
                                  children: [
                                    Positioned(
                                        bottom: 0,
                                        child:
                                            BlocBuilder<FloodLevelCubit, int>(
                                          builder: (context, state) {
                                            return Container(
                                              width: 140,
                                              height: state.toDouble(),
                                              decoration: BoxDecoration(
                                                color: _getColors(state).$1,
                                              ),
                                            );
                                          },
                                        )),
                                    Container(
                                      width: 140,
                                      height: 140,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            color: _getColors(state).$2,
                                            width: 10),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextLarge(
                                _getText(state),
                                bold: true,
                                color: _getColors(state).$2,
                              ),
                              const VGap(gap: 10),
                              TextRegular("Water level increased by: $state cm",
                                  color: Colors.white),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

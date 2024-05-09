// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_application_1/application/flood_level/flood_level_cubit.dart';
import 'package:flutter_application_1/domain/city/city.dart';
import 'package:flutter_application_1/injection.dart';
import 'package:flutter_application_1/presentation/widgets/space.dart';
import 'package:flutter_application_1/presentation/widgets/text.dart';

class StatusUtil {
  final Color backgroundColor;
  final Color foregroundColor;
  final String status;
  StatusUtil({
    required this.backgroundColor,
    required this.foregroundColor,
    required this.status,
  });
}

class FloodLevel extends StatelessWidget {
  final City city;

  const FloodLevel({super.key, required this.city});

  StatusUtil _getStatusUtil(int state) {
    if (state >= 95) {
      return StatusUtil(
        backgroundColor: const Color(0xFFCF765A),
        foregroundColor: const Color(0xFFFFC3B0),
        status: "Danger",
      );
    }

    if (state <= 60) {
      return StatusUtil(
        backgroundColor: const Color(0xFF1BC8D3),
        foregroundColor: const Color(0xFFBFFBFF),
        status: "Normal",
      );
    }
    return StatusUtil(
      backgroundColor: const Color(0xFFBCBE5B),
      foregroundColor: const Color(0xFFF8FA9E),
      status: "Warning",
    );
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
                color: _getStatusUtil(state).backgroundColor,
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
                                                color: _getStatusUtil(state)
                                                    .foregroundColor,
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
                                            color: _getStatusUtil(state)
                                                .foregroundColor,
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
                                _getStatusUtil(state).status,
                                bold: true,
                                color: _getStatusUtil(state).foregroundColor,
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

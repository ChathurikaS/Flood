import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/constants.dart';
import 'package:flutter_application_1/presentation/widgets/text.dart';

class WaterBubble extends StatelessWidget {
  final double waterLevel;

  const WaterBubble({super.key, required this.waterLevel});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: waterLevel * (constraints.maxHeight / maxWaterLevel),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.vertical(
                      top: Radius.circular(constraints.maxWidth / 2)),
                ),
                child: Center(
                  child: TextMedium(
                    "$waterLevel mm",
                    color: Colors.white,
                    bold: true,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0.5 * (constraints.maxHeight / maxWaterLevel),
              left: 0,
              right: 0,
              child: const Divider(
                color: Colors.green,
                thickness: 5,
              ),
            ),
            Positioned(
              bottom: 4 * (constraints.maxHeight / maxWaterLevel),
              left: 0,
              right: 0,
              child: const Divider(
                color: Colors.yellow,
                thickness: 5,
              ),
            ),
            Positioned(
              bottom: 8 * (constraints.maxHeight / maxWaterLevel),
              left: 0,
              right: 0,
              child: const Divider(
                color: Colors.orange,
                thickness: 5,
              ),
            ),
            Positioned(
              bottom: 10 * (constraints.maxHeight / maxWaterLevel),
              left: 0,
              right: 0,
              child: const Divider(
                color: Colors.red,
                thickness: 5,
              ),
            ),
          ],
        );
      },
    );
  }
}

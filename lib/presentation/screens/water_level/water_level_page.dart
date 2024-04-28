import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/presentation/screens/water_level/widgets/water_bubble.dart';
import 'package:flutter_application_1/presentation/widgets/text.dart';

@RoutePage()
class WaterLevelPage extends StatelessWidget {
  const WaterLevelPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.primaryColorLight,
      appBar: AppBar(
        backgroundColor: theme.primaryColor,
        centerTitle: true,
        title: const TextMedium(
          "Kandy",
          color: Colors.white,
          bold: true,
        ),
      ),
      body: const WaterBubble(waterLevel: 4),
    );
  }
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:flutter_application_1/presentation/widgets/space.dart';
import 'package:flutter_application_1/presentation/widgets/text.dart';

class MeasurementCard extends StatelessWidget {
  final String title;
  final String value;
  final String image;
  final Function()? onTap;

  const MeasurementCard({
    super.key,
    required this.title,
    required this.value,
    required this.image,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            TextSmall(title),
            const VGap(gap: 4),
            Material(
              color: theme.scaffoldBackgroundColor.withOpacity(.3),
              borderRadius: BorderRadius.circular(12),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Image.asset(
                  image,
                  width: 50,
                  height: 50,
                ),
              ),
            ),
            const VGap(gap: 4),
            TextSmall(value),
          ],
        ),
      ),
    );
  }
}

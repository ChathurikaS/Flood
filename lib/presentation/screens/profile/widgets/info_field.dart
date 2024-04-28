// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:flutter_application_1/presentation/widgets/text.dart';

class InfoField extends StatelessWidget {
  final String info;
  final Color color;

  const InfoField({
    super.key,
    required this.info,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color.withOpacity(0.5),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: const BorderSide(color: Colors.white)),
      elevation: 12,
      child: Center(
          child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: TextMedium(
          info,
          color: Colors.white,
        ),
      )),
    );
  }
}

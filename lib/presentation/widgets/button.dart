import 'package:flutter/material.dart';
import 'package:flutter_application_1/presentation/core/theme.dart';
import 'package:flutter_application_1/presentation/widgets/text.dart';

class BoxButton extends StatelessWidget {
  final String text;
  final Function() onPressed;
  final bool isSecondary;

  const BoxButton(
      {super.key,
      required this.text,
      required this.onPressed,
      this.isSecondary = false});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
          elevation: MaterialStateProperty.all(12),
          backgroundColor: MaterialStateProperty.all(isSecondary
              ? theme.secondaryColor.withOpacity(.6)
              : theme.primaryColor.withOpacity(.6)),
          padding: MaterialStateProperty.all(
              const EdgeInsets.symmetric(horizontal: 30, vertical: 20)),
          shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)))),
      child: TextMedium(
        text,
        color: Colors.white,
        shadowed: true,
        bold: true,
      ),
    );
  }
}

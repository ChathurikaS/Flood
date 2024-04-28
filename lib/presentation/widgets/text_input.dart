// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:flutter_application_1/presentation/widgets/text.dart';

class TextInput extends StatelessWidget {
  final String hint;
  final String label;
  final String? initialValue;
  final Function(String value) onChanged;
  final Color? backgroundColor;
  final bool isPassword;
  final bool isBordered;
  final TextInputType? keyboardType;

  const TextInput({
    super.key,
    required this.hint,
    required this.label,
    this.initialValue,
    required this.onChanged,
    this.backgroundColor,
    this.isPassword = false,
    this.isBordered = true,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Material(
      elevation: 12,
      color: Colors.transparent,
      shadowColor: Colors.black.withOpacity(.5),
      child: TextFormField(
        initialValue: initialValue,
        onChanged: onChanged,
        keyboardType: keyboardType,
        obscureText: isPassword,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          label: TextMedium(label),
          labelStyle: const TextStyle(color: Colors.white),
          hintText: hint,
          hintStyle: const TextStyle(color: Colors.white70),
          filled: true,
          fillColor: backgroundColor ?? theme.primaryColor.withOpacity(0.5),
          border: OutlineInputBorder(
            borderSide: isBordered
                ? const BorderSide(color: Colors.white)
                : BorderSide.none,
            borderRadius: BorderRadius.circular(8),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: isBordered
                ? const BorderSide(color: Colors.white)
                : BorderSide.none,
            borderRadius: BorderRadius.circular(8),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: isBordered
                ? const BorderSide(color: Colors.white)
                : BorderSide.none,
            borderRadius: BorderRadius.circular(8),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: isBordered
                ? const BorderSide(color: Colors.red)
                : BorderSide.none,
            borderRadius: BorderRadius.circular(8),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: isBordered
                ? const BorderSide(color: Colors.red)
                : BorderSide.none,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}

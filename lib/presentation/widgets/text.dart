// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class TextRegular extends StatelessWidget {
  final String text;
  final Color? color;
  final bool bold;
  final bool overflow;
  final double fontSize;
  final int? maxLines;
  final TextAlign align;
  final bool shadowed;
  final List<Shadow>? shadows;
  const TextRegular(this.text,
      {super.key,
      this.color,
      this.bold = false,
      this.overflow = false,
      this.fontSize = 16,
      this.maxLines,
      this.align = TextAlign.start,
      this.shadowed = false,
      this.shadows = const [
        Shadow(
          blurRadius: 4.0,
          color: Colors.black,
          offset: Offset(1.0, 1.0),
        ),
      ]});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: fontSize,
          fontWeight: bold ? FontWeight.bold : null,
          overflow: overflow ? TextOverflow.ellipsis : null,
          color: color,
          shadows: shadowed ? shadows : null),
      textAlign: align,
      maxLines: maxLines,
    );
  }
}

class TextSmall extends TextRegular {
  const TextSmall(super.text,
      {super.key,
      super.bold,
      super.color,
      super.overflow,
      super.fontSize = 12,
      super.align = TextAlign.start,
      super.shadowed = false,
      super.maxLines});
}

class TextMedium extends TextRegular {
  const TextMedium(super.text,
      {super.key,
      super.bold,
      super.color,
      super.overflow,
      super.fontSize = 22,
      super.align = TextAlign.start,
      super.shadowed = false,
      super.maxLines});
}

class TextLarge extends TextRegular {
  const TextLarge(super.text,
      {super.key,
      super.bold,
      super.color,
      super.overflow,
      super.fontSize = 32,
      super.align = TextAlign.start,
      super.shadowed = false,
      super.shadows = const [
        Shadow(
          blurRadius: 4.0,
          color: Colors.black,
          offset: Offset(2.0, 2.0),
        ),
      ],
      super.maxLines});
}

class TextExLarge extends TextRegular {
  const TextExLarge(super.text,
      {super.key,
      super.bold,
      super.color,
      super.overflow,
      super.fontSize = 48,
      super.align = TextAlign.start,
      super.shadowed = false,
      super.shadows = const [
        Shadow(
          blurRadius: 4.0,
          color: Colors.black,
          offset: Offset(2.0, 2.0),
        ),
      ],
      super.maxLines});
}

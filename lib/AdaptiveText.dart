import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AdaptiveText extends StatelessWidget {
  final String text;
  final TextStyle style;
  final TextAlign textAlign;

  AdaptiveText(this.text,
      {required Key key, required this.style, required this.textAlign})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return kIsWeb
        ? SelectableText(
            text,
            style: style,
            textAlign: textAlign,
          )
        : Text(
            text,
            style: style,
            textAlign: textAlign,
          );
  }
}

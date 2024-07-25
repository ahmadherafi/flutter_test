import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final String title;
  final double? size;
  final Color? color;
  final FontWeight? fontWeight;
  const TextWidget(this.title, {super.key, this.size, this.color , this.fontWeight});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: size ?? 16,
        color: color??Colors.black,
        fontWeight: fontWeight,
      ),
    );
  }
}

class NormalTextWidget extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final TextAlign? textAlign;

  const NormalTextWidget(
    this.text, {
    Key? key,
    this.style,
    this.textAlign,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style ?? TextStyle(fontSize: 16, color: Colors.grey[800]),
      textAlign: textAlign,
    );
  }
}
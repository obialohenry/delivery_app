import 'package:deliveryapp/src/config.dart';
import 'package:flutter/material.dart';

class TextView extends StatelessWidget {
  const TextView({
    required this.text,
    super.key,
    this.textOverflow = TextOverflow.ellipsis,
    this.textAlign = TextAlign.left,
    this.onTap,
    this.textStyle,
    this.color,
    this.fontSize,
    this.fontFamily,
    this.fontWeight,
    this.maxLines,
    this.decoration,
    this.wordSpacing,
    this.letterSpacing,
    this.softRap,
    this.height,
  });

  final String text;
  final TextOverflow? textOverflow;
  final TextAlign? textAlign;
  final VoidCallback? onTap;
  final int? maxLines;
  final double? fontSize;
  final TextStyle? textStyle;
  final Color? color;
  final String? fontFamily;
  final FontWeight? fontWeight;
  final TextDecoration? decoration;
  final double? wordSpacing;
  final double? letterSpacing;
  final bool? softRap;
  final double? height;

  @override
  Widget build(BuildContext context) {
    // ref.watch(themeViewModel).themeMode;
    return GestureDetector(
      onTap: onTap,
      child: Text(
        softWrap: softRap,
        text,
        key: key,
        style: textStyle ??
            TextStyle(
              height: height,
              fontFamily: fontFamily ?? ibmPlexSans,
              fontSize: fontSize != null ? fontSize! : 20.spMin,
              fontWeight: fontWeight ?? FontWeight.w500,
              // color: color ?? AppColors.kTextBlack,
              color: color ?? Theme.of(context).colorScheme.primary,
              // (themeMode == ThemeMode.dark
              // ? Theme.of(context).textTheme.bodySmall!.color
              // : Theme.of(context).primaryColor),
              decoration: decoration,
              wordSpacing: wordSpacing,
              letterSpacing: letterSpacing,
            ),
        textAlign: textAlign,
        overflow: textOverflow,
        maxLines: maxLines,
      ),
    );
  }
}
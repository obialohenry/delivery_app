import 'package:deliveryapp/src/config.dart';
import 'package:deliveryapp/src/utils.dart';
import 'package:flutter/material.dart';

class DefaultButtonMain extends StatelessWidget {
  const DefaultButtonMain(
      {super.key,
      this.onPressed,
      this.text,
      this.color,
      this.textColor,
      this.borderRadius,
      this.width,
      this.height,
      this.padding,
      this.fontSize,
      this.fontWeight,
      this.borderColor,
      this.buttonState = ButtonState.idle,
      this.fontFamily});

  final VoidCallback? onPressed;
  final String? text;
  final Color? color;
  final Color? textColor;
  final double? borderRadius;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? borderColor;
  final ButtonState buttonState;
  final String? fontFamily;

  @override
  Widget build(BuildContext context,) {
    // ThemeMode themeMode = ref.watch(themeViewModel).themeMode;
    return GestureDetector(
      onTap: (buttonState == ButtonState.disabled || buttonState == ButtonState.loading)
          ? null
          : onPressed,
      child: Container(
        height: height ?? 40.0.h,
        width: width,
        padding: padding,
        decoration: BoxDecoration(
          color: color ?? AppColors.kSkylineBlue,

            /// This line of code is setting the background color of the button. It checks the value of the
            /// `buttonState` parameter and if it is equal to `ButtonState.disabled`, it sets the color to
            /// `AppColors.kDarkGrey`. Otherwise, it sets the color to the value of the `color` parameter,
            /// which is passed in when the function is called. If `color` is null, it sets the color to a
            /// default value of `const Color(0xFF09132D)`.
            // color: (buttonState == ButtonState.disabled)
            //     ? AppColors.kPrimary2
            //     : color ?? const Color(0xFF09132D),
            // gradient: (buttonState == ButtonState.disabled)
            //     ? AppColors.disabledGradient
            //     : AppColors.gradientMain,
            // border: Border.all(color: borderColor ?? Colors.transparent),
          borderRadius: BorderRadius.circular(borderRadius ?? 8.0.r),
            border: Border.all(color: borderColor ?? Colors.transparent)),
        child: Center(
          /// This code is setting the child of the `TextButton` widget. It checks the value of the
          /// `buttonState` parameter and if it is equal to `ButtonState.loading`, it sets the child to
          /// a `SizedBox` widget with a `CircularProgressIndicator` inside it. This is used to indicate
          /// that the button is in a loading state and the user should wait for the action to complete.
          /// If `buttonState` is not equal to `ButtonState.loading`, it sets the child to a `Text`
          /// widget with the `text` parameter passed in when the function is called. The `textColor`,
          /// `fontSize`, and `fontWeight` parameters are also used to style the text.
          child: (buttonState == ButtonState.loading)
              ? SizedBox.square(
                  dimension: 35.r,
                  child: const Padding(
                    padding: EdgeInsets.all(4.0),
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  ),
                )
              : Text(
                  text.toString(),
                  style: TextStyle(
                    color: textColor ?? Colors.white,
                    fontSize: fontSize ?? 14.0.spMin,
                    fontWeight: fontWeight ?? FontWeight.w700,
                    fontFamily: fontFamily ?? ibmPlexSans,
                    height: (20 / 14).h,
                  ),
                ),
        ),
      ),
    );
  }
}
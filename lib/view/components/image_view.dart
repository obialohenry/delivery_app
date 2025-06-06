import 'dart:io';
import 'package:deliveryapp/src/utils.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart'

class ImageView extends StatelessWidget {
  final String? url;
  final String? placeholder;
  final Color? color;
  final String? semanticsLabel;
  final double? height;
  final double? width;
  final ImageType type;
  final double? scale;
  final BoxFit? fit;
  final File? imageFile;
  final Widget? errorWidget;
  final Alignment alignment;

  // const ImageView.svg(this.url,
  //     {this.color,
  //     this.semanticsLabel,
  //     this.height,
  //     this.scale,
  //     this.fit,
  //     this.width,
  //     this.alignment = Alignment.center,
  //     super.key})
  //     : type = ImageType.svg,
  //       placeholder = null,
  //       errorWidget = null,
  //       imageFile = null;

  const ImageView.network(this.url,
      {this.color,
      this.semanticsLabel,
      this.height,
      this.scale,
      this.fit,
      this.width,
      this.errorWidget,
      this.placeholder,
      this.alignment = Alignment.center,
      super.key})
      : type = ImageType.network,
        imageFile = null;

  const ImageView.asset(this.url,
      {this.color,
      this.semanticsLabel,
      this.height,
      this.scale,
      this.fit,
      this.width,
      this.alignment = Alignment.center,
      super.key})
      : type = ImageType.asset,
        placeholder = null,
        errorWidget = null,
        imageFile = null;

  const ImageView.file(this.imageFile,
      {this.color,
      this.semanticsLabel,
      this.height,
      this.scale = 1,
      this.fit,
      this.width,
      this.alignment = Alignment.center,
      super.key})
      : type = ImageType.file,
        placeholder = null,
        errorWidget = null,
        url = null;

  @override
  Widget build(BuildContext context) {
    switch (type) {
      // case ImageType.svg:
      //   return SvgPicture.asset(url!,
      //       semanticsLabel: semanticsLabel,
      //       height: height,
      //       width: width,
      //       alignment: alignment,
      //       fit: fit ?? BoxFit.contain,
      //       colorFilter: color != null ? ColorFilter.mode(color!, BlendMode.srcIn) : null);
      case ImageType.network:
        return FadeInImage.assetNetwork(
            placeholderScale: scale,
            fit: fit,
            height: height,
            width: width,
            alignment: alignment,
            fadeInDuration: const Duration(seconds: 1),
            fadeInCurve: Curves.easeInCirc,
            placeholder: placeholder ?? "",
            //TODO:add image to the empty apostrophe.
            image: url!,
            imageErrorBuilder: (context, error, stackTrace) =>
                errorWidget ??
                const Icon(
                  Icons.error,
                  color: Colors.red,
                  size: 30,
                ));
      case ImageType.asset:
        return Image.asset(
          url ?? "ded",
          height: height,
          width: width,
          color: color,
          fit: fit,
          scale: scale,
          alignment: alignment,
          semanticLabel: semanticsLabel,
        );
      case ImageType.file:
        return Image.file(
          imageFile!,
          height: height,
          width: width,
          color: color,
          fit: fit,
          scale: scale!,
          alignment: alignment,
          semanticLabel: semanticsLabel,
        );
    }
  }
}
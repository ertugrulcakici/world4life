import 'package:flutter/material.dart';
import 'package:world4life/core/management/radius/all_radius.dart';
import 'package:world4life/product/enums/image_types.dart';

typedef LoadingCallback = Widget Function(
    BuildContext, Widget, ImageChunkEvent?)?;

class CustomImage extends Image {
  // ignore: use_key_in_widget_constructors
  CustomImage._asset(String name, BoxFit boxfit)
      : super.asset(name, fit: boxfit);

  // ignore: use_key_in_widget_constructors
  CustomImage._network(String name, BoxFit boxFit)
      : super.network(name, loadingBuilder: _loadingBuilder, fit: boxFit);

  static Widget show(ImageType imageType, String url,
      {BoxFit boxfit = BoxFit.cover,
      String errMessage = "",
      double? width,
      double? height,
      Color? backgroundColor}) {
    CustomImage? _child;
    switch (imageType) {
      case ImageType.Asset:
        _child = CustomImage._asset(url, boxfit);
        break;
      case ImageType.Network:
        _child = CustomImage._network(url, boxfit);
        break;
      default:
        _child = null;
        break;
    }
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor ?? const Color.fromARGB(0, 255, 247, 247),
        borderRadius: AllRadius.image(),
      ),
      width: width,
      height: height,
      child: ClipRRect(
        borderRadius: AllRadius.image(),
        child: _child ?? Text(errMessage),
      ),
    );
  }

  // ignore: prefer_function_declarations_over_variables
  static final LoadingCallback _loadingBuilder =
      (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
    if (loadingProgress == null) return child;
    return Center(
      child: CircularProgressIndicator(
        value: loadingProgress.expectedTotalBytes != null
            ? loadingProgress.cumulativeBytesLoaded /
                loadingProgress.expectedTotalBytes!
            : null,
      ),
    );
  };
}

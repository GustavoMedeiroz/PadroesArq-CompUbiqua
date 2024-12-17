// ignore_for_file: constant_identifier_names
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

enum Vectors {
  nav_bar_document,
  nav_bar_home,
  nav_bar_notification,
  nav_bar_settings,
  nav_bar_shield,
}

class Vector extends StatelessWidget {
  final Vectors? vector;
  final double? size;
  final double? width;
  final double? height;
  final Color? color;
  final BoxFit? fit;
  final Alignment? alignment;
  final BlendMode? blendMode;

  const Vector(this.vector, {
    super.key,
    this.size,
    this.width,
    this.height,
    this.color,
    this.fit,
    this.alignment,
    this.blendMode,
  });

  @override
  Widget build(BuildContext context) {
    if (vector == null) return Container();
    String fileName = vector?.name.toLowerCase() ?? '';
    String path = 'assets/icons/$fileName.svg';

    return SvgPicture.asset(
      path,
      alignment: alignment ?? Alignment.center,
      fit: fit ?? BoxFit.cover,
      width: width ?? size,
      height: height ?? size,
      colorFilter: color != null ? ColorFilter.mode(
        color ?? Colors.transparent, blendMode ?? BlendMode.srcIn,) : null,
    );
  }
}

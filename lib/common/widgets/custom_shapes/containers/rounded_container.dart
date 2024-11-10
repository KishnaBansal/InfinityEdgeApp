import 'package:flutter/material.dart';
import 'package:infinity_edge_app/utils/constants/colors.dart';
import 'package:infinity_edge_app/utils/constants/sizes.dart';

class KRoundedContainer extends StatelessWidget {
  const KRoundedContainer({
    super.key,
    this.width,
    this.height,
    this.radius = KSizes.cardRadiusLg,
    this.child,
    this.showBorder = false,
    this.borderColor = KColors.borderPrimary,
    this.padding,
    this.margin,
    this.backgroundColor = KColors.white,
  });
  final double? width;
  final double? height;
  final double radius;
  final Widget? child;
  final bool showBorder;
  final Color borderColor;
  final Color backgroundColor;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(radius),
        border: showBorder ? Border.all(color: borderColor) : null,
      ),
      child: child,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ReusableContainer extends StatelessWidget {
  double? Height;
  double? Width;
  Widget? child;
  BorderRadius? borderRadius;
  Border? border;
  Gradient? gradient;
  double? elevation = 1;
  EdgeInsets? margin;
  Color? color;

  ReusableContainer(
      {super.key,
      this.Height,
      this.Width,
      this.child,
      this.borderRadius,
      this.border,
      this.gradient,
      this.elevation,
      this.margin,
      this.color});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: elevation ?? 0,
      borderRadius: borderRadius,
      child: Container(
        margin: margin,
        height: Height,
        width: Width,
        decoration: BoxDecoration(
            color: color,
            gradient: gradient,
            border: border,
            borderRadius: borderRadius),
        child: child,
      ),
    );
  }
}

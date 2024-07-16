import 'package:flutter/material.dart';
import 'package:todoappmy/utils/utils.dart';

class CommonContainer extends StatelessWidget {
  const CommonContainer({super.key, this.child, this.heightPercentage});
  final Widget? child;
  final double? heightPercentage;

  @override
  Widget build(BuildContext context) {
    final deviceSize = context.deviceSize;
    final colors = context.colorScheme;
    return Container(
        width: deviceSize.width,
        height: deviceSize.height * (heightPercentage ?? 0.3),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: colors.primaryContainer),
        child: child);
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PageViewDots extends StatelessWidget {
  PageViewDots({
    super.key,
    required this.index,
  });
  final int index;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(3, (indexDots) {
        return Container(
          margin: EdgeInsets.only(left: 5),
          width: index == indexDots ? 25 : 8,
          height: 8,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: index == indexDots ? Colors.blueAccent : Colors.black45),
        );
      }),
    );
  }
}

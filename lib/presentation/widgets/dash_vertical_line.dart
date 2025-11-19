import 'package:flutter/material.dart';

class DashVerticalLine extends StatelessWidget {
  const DashVerticalLine({
    super.key,
     this.dashHeight = 4,
     this.dashWidth = 1,
     this.color = Colors.black26,
     this.dashGap = 4,
  });
  final double dashHeight;
  final double dashWidth;
  final Color color;
  final double dashGap;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final dashCount = (constraints.maxHeight / (dashHeight + dashGap))
            .floor();
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            dashCount, (_) {
            return Padding(
              padding: EdgeInsets.only(bottom: dashGap),
              child: SizedBox(
                width: dashWidth,
                height: dashHeight,
                child: DecoratedBox(decoration: BoxDecoration(color: color)),
              ),
            );
          }),
        );
      },
    );
  }
}

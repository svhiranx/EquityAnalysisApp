import 'package:flutter/material.dart';

class _ChartData {
  _ChartData(this.x, this.y);

  final String x;
  final double y;
}

double widthpercent(double percent) {
  if (percent >= 100)
    return 100;
  else if (percent.abs() <= 1)
    return 1;
  else
    return percent.abs();
}

class ChartBar extends StatelessWidget {
  double percent;
  ChartBar(this.percent);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    var data = _ChartData('CHN', 12);
    return Container(
      height: height * 0.04,
      width: width * 0.5,
      child: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
                color: Color.fromRGBO(241, 241, 241, 1),
                borderRadius: BorderRadius.all(Radius.circular(8))),
          ),
          FractionallySizedBox(
            widthFactor: widthpercent(percent) / 100,
            child: Container(
                decoration: BoxDecoration(
                    color: percent >= 0
                        ? const Color.fromRGBO(0, 128, 1, 1)
                        : const Color.fromRGBO(254, 0, 11, 1),
                    borderRadius: widthpercent(percent) < 100
                        ? const BorderRadius.only(
                            bottomLeft: Radius.circular(8),
                            topLeft: Radius.circular(8))
                        : BorderRadius.all(Radius.circular(8)))),
          )
        ],
      ),
    );
  }
}

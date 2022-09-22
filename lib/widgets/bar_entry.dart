import 'package:flutter/material.dart';
import 'package:paprclip_task/models/tech_perf.dart';
import 'package:paprclip_task/widgets/chartbar.dart';

class BarEntry extends StatelessWidget {
  TechPerf techPerf;
  BarEntry(this.techPerf);
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      child: Row(
        children: [
          Container(
              width: width * 0.3,
              padding: EdgeInsets.all(width * 0.03),
              child: Text(
                techPerf.label,
                style: const TextStyle(
                    fontSize: 17,
                    color: Color.fromRGBO(51, 73, 115, 1),
                    fontWeight: FontWeight.w400),
              )),
          Align(
              alignment: Alignment.center,
              child: ChartBar(techPerf.changePercent!)),
          Container(
              width: width * 0.2,
              alignment: Alignment.bottomRight,
              padding: EdgeInsets.all(width * 0.02),
              child: Text(
                techPerf.changePercent!.toStringAsFixed(2),
                style: Theme.of(context).textTheme.bodyText1,
              ))
        ],
      ),
    );
  }
}

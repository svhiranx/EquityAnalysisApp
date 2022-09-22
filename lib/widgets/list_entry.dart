import 'package:flutter/material.dart';

class ListEntry extends StatelessWidget {
  String name;
  String? value;
  ListEntry({required this.name, required this.value});
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
            padding: EdgeInsets.all(width * 0.03),
            child: Text(
              name,
              style: const TextStyle(
                  fontSize: 17,
                  color: Color.fromRGBO(51, 73, 115, 1),
                  fontWeight: FontWeight.w400),
            )),
        Padding(
            padding: EdgeInsets.all(width * 0.02),
            child: Text(
              value ?? "-",
              style: Theme.of(context).textTheme.bodyText1,
            ))
      ],
    );
  }
}

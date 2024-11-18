import 'package:flutter/material.dart';

class RoundedCornerList extends StatelessWidget {
  final List<String> items;
  final double padding;
  final List<double> widths;
  final List<Color> colors;

  // we can have a variable of no. of countries
  // and make the width of every country in ratio with the no. of countries
  // but I'll go with this for now
  const RoundedCornerList({
    required this.items,
    required this.widths,
    required this.colors,
    this.padding = 10,
    Key? key,
  })  : assert(items.length == widths.length,
            "Items and widths must have the same length"),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(items.length, (index) {
        BorderRadius borderRadius;

        // Determine corner rounding rules
        if (index == 0) {
          borderRadius = BorderRadius.only(
              topLeft: Radius.circular(10), bottomRight: Radius.circular(10));
        } else if (index == items.length - 1) {
          borderRadius = BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10));
        } else {
          borderRadius = BorderRadius.only(
            bottomRight: Radius.circular(10),
          ); // No rounding for other items
        }

        return Container(
          padding: EdgeInsets.all(padding),
          width: widths[index],
          decoration: BoxDecoration(
            color: colors[index],
            borderRadius: borderRadius,
          ),
          child: Text(
            items[index],
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        );
      }),
    );
  }
}

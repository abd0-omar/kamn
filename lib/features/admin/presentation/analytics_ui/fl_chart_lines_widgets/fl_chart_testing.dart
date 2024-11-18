import 'dart:collection';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:kamn/core/usecase/usecase.dart';
import 'package:kamn/core/utils/try_and_catch.dart';

class _LineChart extends StatelessWidget {
  const _LineChart({
    required this.showShadow,
    required this.onTouch,
  });

  final bool showShadow;
  final ValueChanged<bool> onTouch;

  @override
  Widget build(BuildContext context) {
    return LineChart(
      sampleData1,
    );
  }

  LineChartData get sampleData1 => LineChartData(
        lineTouchData: lineTouchData,
        gridData: gridData,
        titlesData: titlesData1,
        borderData: borderData,
        lineBarsData: showShadow
            ? [
                lineChartBarData1_1Shadow,
                lineChartBarData1_2Shadow,
                lineChartBarData1_1,
                lineChartBarData1_2
              ]
            : [lineChartBarData1_1, lineChartBarData1_2],
        minX: 0,
        maxX: 14,
        maxY: 6,
        minY: 0,
      );

  LineTouchData get lineTouchData => LineTouchData(
        touchCallback: (FlTouchEvent event, LineTouchResponse? response) {
          if (event is FlPanStartEvent) {
            onTouch(true); // Show shadow
          } else if (event is FlPanEndEvent) {
            onTouch(false); // Hide shadow
          }
        },
      );

  FlTitlesData get titlesData1 => FlTitlesData(
        bottomTitles: AxisTitles(
          sideTitles: bottomTitles,
        ),
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        leftTitles: AxisTitles(
          sideTitles: leftTitles(),
        ),
      );

  LineTouchData get lineTouchData2 => const LineTouchData(
        enabled: false,
      );

  FlTitlesData get titlesData2 => FlTitlesData(
        bottomTitles: AxisTitles(
          sideTitles: bottomTitles,
        ),
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        leftTitles: AxisTitles(
          sideTitles: leftTitles(),
        ),
      );

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    String text;
    switch (value.toInt()) {
      case 0:
        text = '9 pm';
        break;
      case 2:
        text = '10 pm';
        break;
      case 4:
        text = '11 pm';
        break;
      case 6:
        text = '12 pm';
        break;
      default:
        // TODO: remove
        text = 'noo';
        return Container();
    }

    // in the figma the text is not centered
    return Text(text, style: style, textAlign: TextAlign.center);
  }

  SideTitles leftTitles() => SideTitles(
        getTitlesWidget: leftTitleWidgets,
        showTitles: true,
        interval: 1,
        reservedSize: 42,
      );

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 16,
    );
    Widget text;
    switch (value.toInt()) {
      case 1:
        text = const Text('Sat', style: style);
        break;
      case 3:
        text = const Text('Sun', style: style);
        break;
      case 5:
        text = const Text('Mon', style: style);
        break;
      case 7:
        text = const Text('Tue', style: style);
        break;
      case 9:
        text = const Text('Wed', style: style);
        break;
      case 11:
        text = const Text('Thu', style: style);
        break;
      case 13:
        text = const Text('Fri', style: style);
        break;
      default:
        text = const Text('');
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 10,
      child: text,
    );
  }

  SideTitles get bottomTitles => SideTitles(
        showTitles: true,
        reservedSize: 32,
        interval: 1,
        getTitlesWidget: bottomTitleWidgets,
      );

  // FlGridData get gridData => const FlGridData(show: false);
  FlGridData get gridData => FlGridData(
        show: true, // Enable the grid lines
        verticalInterval: 2, // Spacing for vertical grid lines
        drawHorizontalLine: false,
        drawVerticalLine: true,
        getDrawingVerticalLine: (value) {
          return FlLine(
            color: Colors.grey.withOpacity(0.5), // Color of vertical lines
            strokeWidth: 1, // Thickness of vertical lines
          );
        },
      );

  FlBorderData get borderData => FlBorderData(
        show: true,
        border: const Border(
          // bottom:
          //     // BorderSide(color: AppColors.primary.withOpacity(0.2), width: 4),
          //     BorderSide(color: Colors.cyan.withOpacity(0.2), width: 4),
          left: BorderSide(color: Colors.transparent),
          right: BorderSide(color: Colors.transparent),
          top: BorderSide(color: Colors.transparent),
        ),
      );

  LineChartBarData get lineChartBarData1_1 => LineChartBarData(
        isCurved: true,
        color: Colors.blue,
        barWidth: 8,
        isStrokeCapRound: true,
        dotData: const FlDotData(show: false),
        belowBarData: BarAreaData(show: false),
        spots: const [
          FlSpot(1, 1),
          FlSpot(3, 1.5),
          FlSpot(5, 1.4),
          FlSpot(7, 3.4),
          FlSpot(10, 2),
          FlSpot(12, 2.2),
          FlSpot(13, 1.8),
        ],
      );

  LineChartBarData get lineChartBarData1_1Shadow => LineChartBarData(
        isCurved: true,
        color: Colors.blue.withOpacity(0.2),
        barWidth: 24,
        isStrokeCapRound: true,
        dotData: const FlDotData(show: false),
        belowBarData: BarAreaData(show: false),
        spots: const [
          FlSpot(1, 1),
          FlSpot(3, 1.5),
          FlSpot(5, 1.4),
          FlSpot(7, 3.4),
          FlSpot(10, 2),
          FlSpot(12, 2.2),
          FlSpot(13, 1.8),
        ],
      );

  LineChartBarData get lineChartBarData1_2Shadow => LineChartBarData(
        isCurved: true,
        color: Colors.red.withOpacity(0.2), // Add opacity for shadow
        barWidth: 24,
        isStrokeCapRound: true,
        dotData: const FlDotData(show: false),
        spots: const [
          FlSpot(1, 1),
          FlSpot(3, 2.8),
          FlSpot(7, 1.2),
          FlSpot(10, 2.8),
          FlSpot(12, 2.6),
          FlSpot(13, 3.9),
        ],
      );

  LineChartBarData get lineChartBarData1_2 => LineChartBarData(
        isCurved: true,
        color: Colors.red,
        barWidth: 8,
        isStrokeCapRound: true,
        dotData: const FlDotData(show: false),
        spots: const [
          FlSpot(1, 1),
          FlSpot(3, 2.8),
          FlSpot(7, 1.2),
          FlSpot(10, 2.8),
          FlSpot(12, 2.6),
          FlSpot(13, 3.9),
        ],
      );
}

class LineChartSample1 extends StatefulWidget {
  const LineChartSample1({super.key});

  @override
  State<StatefulWidget> createState() => LineChartSample1State();
}

class LineChartSample1State extends State<LineChartSample1> {
  bool showShadow = false; // State variable for shadow visibility

  void _updateShadowVisibility(bool visible) {
    setState(() {
      showShadow = visible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.23,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(right: 20),
                child: Stack(
                  alignment: Alignment.center, // Align all children to the left
                  children: [
                    // Chart icon
                    Positioned(
                      child: Icon(
                        Icons.show_chart,
                        size: 32,
                      ),
                    ),
                    Positioned(
                      top: 10,
                      right: 0,
                      child: Icon(
                        Icons.horizontal_rule_outlined,
                        size: 40,
                      ),
                    ),
                    // Rotated vertical line
                    Positioned(
                      right: 10,
                      child: Transform.rotate(
                        angle: 1.5708, // 90 degrees in radians
                        child: Icon(
                          Icons.horizontal_rule_outlined,
                          size: 40,
                        ),
                      ),
                    ),
                    // Horizontal line
                  ],
                ),
              ),
              const Text(
                'Peak time reservations',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          const SizedBox(
            height: 37,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 16, left: 6),
              child: _LineChart(
                showShadow: showShadow,
                onTouch: _updateShadowVisibility,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/const/constants.dart';
import 'package:kamn/core/helpers/spacer.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/style.dart';
// import 'package:kamn/features/sports/presentation/screens/fl_chart_lines_widgets/countries.dart';
// import 'package:kamn/features/sports/presentation/screens/fl_chart_lines_widgets/fl_chart_testing.dart';
// import 'package:kamn/features/sports/presentation/widgets/custom_profile_top_bar.dart';
// import 'package:kamn/features/sports/presentation/widgets/custome_user_data.dart';
// import 'package:kamn/features/sports/presentation/widgets/custome_user_options.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:kamn/features/admin/presentation/analytics_ui/fl_chart_lines_widgets/countries.dart';
import 'package:kamn/features/admin/presentation/analytics_ui/fl_chart_lines_widgets/fl_chart_testing.dart';

class MyProfileScreen extends StatelessWidget {
  const MyProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPallete.whiteColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 8 countries row
            Container(
              margin: EdgeInsets.symmetric(vertical: 20),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 1), // changes position of shadow
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Average Locations",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 30.0), // Adjust the padding here
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.more_vert,
                            size: 35,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum ",
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "list of locations",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "8 locations",
                        style: TextStyle(color: Colors.grey, fontSize: 20),
                      )
                    ],
                  ),
                  RoundedCornerList(
                    items: [
                      "Lorem 1",
                      "Lorem 2",
                      "Lorem 3",
                      "Lorem 4",
                      "Lorem 5",
                      "Lorem 6",
                      "Lorem 7",
                    ],
                    widths: [
                      double.infinity,
                      330,
                      300,
                      250,
                      200,
                      150,
                      100,
                    ],
                    colors: [
                      Color(0xFFF72585),
                      Color(0xFFB5179E),
                      Color(0xFF7209B7),
                      Color(0xFF560BAD),
                      Color(0xFF480CA8),
                      Color(0xFF3A0CA3),
                      Color(0xFF3F37C9),
                      Color(0xFF4361EE),
                    ],
                  ),
                ],
              ),
            ),
            // Add Line Chart Sample
            Container(
                margin: EdgeInsets.symmetric(vertical: 20),
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 1),
                    ),
                  ],
                ),
                child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      LineChartSample1(), // Insert the LineChartSample1 widget here
                      Text(
                          "lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum "),
                      Row(
                        children: [
                          Icon(
                            Icons.circle,
                            color: Colors.blue,
                          ),
                          Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: Text("Peak time")),
                          Icon(
                            Icons.circle,
                            color: Colors.red,
                          ),
                          Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: Text("Lowest time")),
                        ],
                      )
                    ])),
          ],
        ),
      ),
    );
  }
}

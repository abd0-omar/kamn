import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/const/constants.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/style.dart';

class CustomeBottomBook extends StatelessWidget {
  const CustomeBottomBook({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.white,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(65),
          color: AppPallete.greenColor,
        ),
        child: Padding(
          padding: EdgeInsets.only(left: 20.w, right: 10.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RichText(
                text: TextSpan(
                    text: '250 LE',
                    style: TextStyles.font32OfWhiteMedium,
                    children: [
                      TextSpan(
                          text: ' / hr', style: TextStyles.font20OfWhiteReuglar)
                    ]),
              ),
              ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    Constants.bookNow,
                    style: TextStyles.font16greenSemiBold,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/theme/app_pallete.dart';

class CustomeMenuItem extends StatelessWidget {
  final String title;
  final String image;

   const CustomeMenuItem({
    super.key,
    required this.image,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ImageIcon(
        AssetImage(image),
        size: 22.73.h,
        color: AppPallete.mainColor,
      ),
      //Icon(icon, color: Colors.purple, size: 24.sp),
      // Responsive icon size
      title: Text(
        title,
        style: TextStyle(fontSize: 16.sp), // Responsive font size
      ),
      trailing: Icon(Icons.arrow_forward_ios, size: 16.h, color: Colors.grey),
      // Responsive icon size
      onTap: () {
        // Handle the tap action here
      },
    );
  }
}

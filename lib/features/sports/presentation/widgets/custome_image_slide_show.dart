import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/theme/app_pallete.dart';

class CustomeImageSlideShow extends StatelessWidget {
  const CustomeImageSlideShow({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> imagesPath = [
      'assets/images/ground_image.png',
      'assets/images/ground_image.png',
      'assets/images/ground_image.png',
    ];
    return Stack(
      children: [
        // The Image Slideshow
        ImageSlideshow(
          indicatorBottomPadding: 70.h, // Padding for indicators
          width: double.infinity,
          height: 346.h,
          initialPage: 0,
          indicatorColor: AppPallete.greenColor,
          indicatorBackgroundColor: AppPallete.lgGreyColor,
          autoPlayInterval: 3000,
          isLoop: true,
          children: imagesPath.map((path) {
            return Image.asset(
              path,
              width: double.infinity,
              fit: BoxFit.cover,
            );
          }).toList(),
        ),
        Positioned(
          top: 20.h,
          left: 20.w,
          right: 20.w,
          child: SizedBox(
            width: 340.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {},
                  child: Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppPallete.greenColor,
                        border: Border.all(color: Colors.white, width: 1)),
                    child: const Icon(Icons.arrow_back,
                        color: AppPallete.ofWhiteColor),
                  ),
                ),
                const Icon(
                  Icons.bookmark_border,
                  color: Colors.white,
                  size: 30,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

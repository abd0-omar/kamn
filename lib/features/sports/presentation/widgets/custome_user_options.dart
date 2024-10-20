import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/helpers/spacer.dart';
import 'package:kamn/features/sports/presentation/widgets/custome_menu_item.dart';

import '../../../../core/const/image_links.dart';

class CustomeUserOptions extends StatelessWidget {
  const CustomeUserOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 22),
          child: CustomeMenuItem(
              image: ImageLinks.reservationIcon, title: "My Reservations"),
        ),
        divider(25, 25), // Responsive indent
        const CustomeMenuItem(
            image: ImageLinks.shoppingCartIcon, title: "My Store"),
        divider(25, 25), // Responsive indent
        verticalSpace(70),

        const CustomeMenuItem(
            image: ImageLinks.inviteFriendsIcon, title: "Invite Friends"),
        divider(25, 25),
        const CustomeMenuItem(image: ImageLinks.myOrderIcon, title: "My Order"),
        divider(25, 25),
        const CustomeMenuItem(image: ImageLinks.settingIcon, title: "Settings"),
      ],
    );
  }
}

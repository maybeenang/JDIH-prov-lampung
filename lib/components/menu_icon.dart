import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../styles/colors.dart';

class MenuIcon extends StatelessWidget {
  const MenuIcon(
      {super.key, required this.iconPath, required this.title, this.route});
  final String iconPath;
  final String title;
  final String? route;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 70,
      height: 82,
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/$route');
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Stack(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: const Color(0xFFD5E5F2),
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                SvgPicture.asset(iconPath),
              ],
            ),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                height: 0.9,
                color: AppColors.textColor,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../styles/colors.dart';

class BeritaItem extends StatelessWidget {
  const BeritaItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 300,
        height: 166,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black38),
          borderRadius: BorderRadius.circular(10),
          image: const DecorationImage(
            image: AssetImage('assets/images/berita.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height: 70.0,
              width: double.infinity,
              color: Colors.white,
              child: const Padding(
                padding: EdgeInsets.all(10.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.calendar_today,
                                color: AppColors.textColor,
                                size: 14,
                              ),
                              SizedBox(width: 5.0),
                              Text(
                                '23 Juni 2023',
                                style: TextStyle(
                                  color: AppColors.textColor,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(width: 10.0),
                          Row(
                            children: [
                              Icon(
                                Icons.remove_red_eye_outlined,
                                color: AppColors.textColor,
                                size: 14,
                              ),
                              SizedBox(width: 5.0),
                              Text(
                                '60',
                                style: TextStyle(
                                  color: AppColors.textColor,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Text(
                        'Pelaksanaan Rapat Koordinasi Pembinaan dan Pengembangan JDIH Provinsi Lampung',
                        maxLines: 2,
                        style: TextStyle(
                          overflow: TextOverflow.ellipsis,
                          color: AppColors.textColor,
                          fontSize: 14,
                          height: 0.95,
                          fontWeight: FontWeight.w700,
                        ),
                      )
                    ]),
              ),
            ),
          ],
        ));
  }
}

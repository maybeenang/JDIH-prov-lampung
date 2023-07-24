import 'package:flutter/material.dart';

import '../styles/colors.dart';

class MonografiItem extends StatelessWidget {
  const MonografiItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
                      Text(
                        'Pelaksanaan Rapat Koordinasi Pembinaan dan Pengembangan JDIH Provinsi Lampung',
                        maxLines: 3,
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

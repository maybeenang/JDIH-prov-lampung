import 'package:flutter/material.dart';

import '../styles/colors.dart';

class ArtikelItem extends StatelessWidget {
  const ArtikelItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 300,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black38),
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'QUALITY OF PREPARATION OF ACADEMIC TEXTS ON REGIONAL REGULATIONS BASED ON PANCASILA',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: AppColors.textColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w700),
              ),
              const Text(
                  'lorem ipsum bla bla bla bla bla bla bla balanskad sjdasdjsa das j',
                  style: TextStyle(
                      color: AppColors.textColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w400)),
              SizedBox(height: 10.0),
              const Row(
                children: [
                  Icon(
                    Icons.calendar_today,
                    color: AppColors.textColor,
                    size: 14,
                  ),
                  SizedBox(width: 5.0),
                  Text(
                    '24 Feb 2023',
                    style: TextStyle(fontSize: 10, color: AppColors.textColor),
                  )
                ],
              ),
              const Divider(color: Colors.black38),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor: MaterialStateColor.resolveWith(
                          (states) => AppColors.textColor),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                      ),
                    ),
                    child: const Text(
                      'Unduh Dokumen',
                      style: TextStyle(color: Colors.white),
                    )),
              ),
            ],
          ),
        ));
  }
}

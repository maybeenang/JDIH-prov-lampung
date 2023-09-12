import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:jdih/constants/string.dart';
import 'package:jdih/models/berita.dart';

import '../styles/colors.dart';

class BeritaItem extends StatelessWidget {
  const BeritaItem({super.key, required this.data});

  final Berita data;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push('/berita/detail/${data.id}');
      },
      child: Container(
          width: 300,
          height: 166,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black38),
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: NetworkImage(data.image!),
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
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.calendar_today,
                                color: AppColors.textColor,
                                size: 14,
                              ),
                              const SizedBox(width: 5.0),
                              Text(
                                AppString.convertDate(data.date!),
                                style: const TextStyle(
                                  color: AppColors.textColor,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(width: 10.0),
                          Row(
                            children: [
                              const Icon(
                                Icons.remove_red_eye_outlined,
                                color: AppColors.textColor,
                                size: 14,
                              ),
                              const SizedBox(width: 5.0),
                              Text(
                                data.dilihat!.toString(),
                                style: const TextStyle(
                                  color: AppColors.textColor,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Text(
                        data.title!,
                        maxLines: 1,
                        style: const TextStyle(
                          overflow: TextOverflow.ellipsis,
                          color: AppColors.textColor,
                          fontSize: 14,
                          height: 0.95,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        data.content!,
                        maxLines: 2,
                        style: const TextStyle(
                          overflow: TextOverflow.ellipsis,
                          color: AppColors.textColor,
                          fontSize: 14,
                          height: 0.95,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
        padding: EdgeInsets.only(bottom: 10.0),
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black38),
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              clipBehavior: Clip.antiAlias,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
              ),
              child: FadeInImage(
                width: double.infinity,
                height: 120,
                fit: BoxFit.cover,
                image: NetworkImage(data.image!),
                placeholder: const AssetImage('assets/images/berita.png'),
                imageErrorBuilder: (context, error, stackTrace) => const Image(
                  image: AssetImage('assets/images/berita.png'),
                  width: double.infinity,
                  height: 120,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 15.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
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
                        data.tanggal!,
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
            ),
            const SizedBox(height: 5.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                data.title!,
                maxLines: 2,
                style: const TextStyle(
                  overflow: TextOverflow.ellipsis,
                  color: AppColors.textColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const SizedBox(height: 5.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                data.content!,
                maxLines: 2,
                style: const TextStyle(
                  overflow: TextOverflow.ellipsis,
                  color: Colors.black54,
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

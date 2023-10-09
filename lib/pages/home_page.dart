import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jdih/components/berita_item.dart';
import 'package:jdih/components/loading/loading_berita_item.dart';
import 'package:jdih/components/menu_icon.dart';
import 'package:jdih/components/search_box.dart';
import 'package:jdih/providers/berita_controller.dart';

import '../styles/colors.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final berita = ref.watch(beritaControllerProvider);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 90,
        title: const Padding(
          padding: EdgeInsets.only(left: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Selamat Datang di Aplikasi',
                style: TextStyle(
                  color: AppColors.textColor,
                  fontSize: 16,
                ),
              ),
              Text(
                'JDIH Provinsi Lampung',
                style: TextStyle(color: AppColors.textColor, fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Image.asset(
              'assets/images/logo.png',
              width: 120,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 30.0),
                  const SearchBox(),
                  const SizedBox(height: 20.0),
                  const Text(
                    'Fitur',
                    style: TextStyle(color: AppColors.textColor, fontSize: 24, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 20.0),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      MenuIcon(
                        title: 'Produk Hukum',
                        iconPath: 'assets/svg/ic_produkhukum.svg',
                        route: 'produkhukum',
                      ),
                      MenuIcon(
                        title: 'Monografi Hukum',
                        iconPath: 'assets/svg/ic_monografihukum.svg',
                        route: 'monografihukum',
                      ),
                      MenuIcon(
                        title: 'Putusan',
                        iconPath: 'assets/svg/ic_putusan.svg',
                        route: 'putusan',
                      )
                    ],
                  ),
                  const SizedBox(height: 20.0),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      MenuIcon(
                        title: 'Artikel Hukum',
                        iconPath: 'assets/svg/ic_artikelhukum.svg',
                        route: 'artikelhukum',
                      ),
                      MenuIcon(
                        title: 'Berita',
                        iconPath: 'assets/svg/ic_berita.svg',
                        route: 'berita',
                      ),
                      MenuIcon(
                        title: 'Galeri',
                        iconPath: 'assets/svg/ic_galeri.svg',
                        route: 'galeri',
                      )
                    ],
                  ),
                  const SizedBox(height: 30.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Berita Terbaru',
                        style: TextStyle(color: AppColors.textColor, fontSize: 24, fontWeight: FontWeight.w500),
                      ),
                      TextButton(
                        onPressed: () {
                          context.push('/berita');
                        },
                        child: const Text(
                          "Selengkapnya",
                          style: TextStyle(color: Color(0xFF0088FF), fontSize: 14, fontWeight: FontWeight.normal),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10.0),
                ],
              ),
            ),
            SizedBox(
              height: 250,
              child: berita.maybeWhen(
                orElse: () {
                  return ListView.separated(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    scrollDirection: Axis.horizontal,
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return const LoadingBeritaItem();
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(width: 10.0);
                    },
                  );
                },
                data: (data) {
                  if (data == null) {
                    return const Center(
                      child: Text("Data tidak ditemukan"),
                    );
                  }
                  return ListView.separated(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    scrollDirection: Axis.horizontal,
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return BeritaItem(
                        data: data[index],
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(width: 10.0);
                    },
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

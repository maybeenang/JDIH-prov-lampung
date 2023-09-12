import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../styles/colors.dart';

class SearchBoxProduk extends HookConsumerWidget {
  const SearchBoxProduk({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final judul = useTextEditingController();
    final tahun = useTextEditingController();
    final nomor = useTextEditingController();

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.0), color: AppColors.textColor),
      child: Column(
        children: [
          TextField(
            controller: judul,
            decoration: const InputDecoration(
              filled: true,
              fillColor: Colors.white,
              hintText: 'Judul Dokumen',
              hintStyle: TextStyle(
                color: Colors.black26,
                fontSize: 14,
              ),
            ),
            style: const TextStyle(color: Colors.black, fontSize: 14),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                flex: 2,
                child: TextField(
                  controller: tahun,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Tahun',
                    hintStyle: TextStyle(
                      color: Colors.black26,
                      fontSize: 14,
                    ),
                  ),
                  style: const TextStyle(color: Colors.black, fontSize: 14),
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Expanded(
                child: TextField(
                  controller: nomor,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Nomor',
                    hintStyle: TextStyle(
                      color: Colors.black26,
                      fontSize: 14,
                    ),
                  ),
                  style: const TextStyle(color: Colors.black, fontSize: 14),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                  backgroundColor: MaterialStateColor.resolveWith(
                      (states) => const Color(0xFFF4C54D)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                  )),
              child: const Text(
                'Cari',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

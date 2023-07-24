import 'package:flutter/material.dart';

import '../styles/colors.dart';

class SearchBoxProduk extends StatelessWidget {
  const SearchBoxProduk({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.0), color: AppColors.textColor),
      child: Column(
        children: [
          const TextField(
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              hintText: 'Judul Dokumen',
              hintStyle: TextStyle(
                color: Colors.black26,
                fontSize: 14,
              ),
            ),
            style: TextStyle(color: Colors.black, fontSize: 14),
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                flex: 2,
                child: DropdownButtonFormField(
                  isExpanded: true,
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Kategori',
                    hintStyle: TextStyle(
                      color: Colors.black26,
                      fontSize: 14,
                    ),
                  ),
                  style: const TextStyle(color: Colors.black, fontSize: 14),
                  items: const [
                    DropdownMenuItem(
                      child: Text('Semua'),
                      value: 'Semua',
                    ),
                    DropdownMenuItem(
                      child: Text('Peraturan Daerah'),
                      value: 'Peraturan Daerah',
                    ),
                    DropdownMenuItem(
                      child: Text('Peraturan Gubernur'),
                      value: 'Peraturan Gubernur',
                    ),
                    DropdownMenuItem(
                      child: Text('Peraturan Bupati'),
                      value: 'Peraturan Bupati',
                    ),
                    DropdownMenuItem(
                      child: Text('Peraturan Menteri'),
                      value: 'Peraturan Menteri',
                    ),
                    DropdownMenuItem(
                      child: Text('Peraturan Presiden'),
                      value: 'Peraturan Presiden',
                    ),
                  ],
                  onChanged: (value) {},
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Expanded(
                child: DropdownButtonFormField(
                  isExpanded: true,
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Kategori',
                    hintStyle: TextStyle(
                      color: Colors.black26,
                      fontSize: 14,
                    ),
                  ),
                  style: const TextStyle(color: Colors.black, fontSize: 14),
                  items: const [
                    DropdownMenuItem(
                      child: Text('Semua'),
                      value: 'Semua',
                    ),
                    DropdownMenuItem(
                      child: Text('2020'),
                      value: '2020',
                    ),
                  ],
                  onChanged: (value) {},
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
                        (states) => Color(0xFFF4C54D)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                    )),
                child: const Text('Cari',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ))),
          ),
        ],
      ),
    );
  }
}

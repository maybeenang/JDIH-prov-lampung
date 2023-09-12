import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../styles/colors.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push('/produkhukum');
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.75,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 13),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.0),
                color: Colors.white,
                border: Border.all(color: Colors.black26),
              ),
              child: const Text("Cari Produk Hukum"),
            ),
          ),
          IconButton.filled(
              style: ButtonStyle(
                padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                    const EdgeInsets.all(10.0)),
                backgroundColor: MaterialStateColor.resolveWith(
                    (states) => AppColors.textColor),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                ),
              ),
              onPressed: () {},
              icon: const Icon(Icons.search),
              color: Colors.white),
        ],
      ),
    );
  }
}

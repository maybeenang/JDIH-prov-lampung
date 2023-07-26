import 'package:flutter/material.dart';

import '../styles/colors.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.75,
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Judul Dokumen',
              hintStyle: const TextStyle(
                color: Colors.black26,
                fontSize: 14,
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.black26,
                ),
                borderRadius: BorderRadius.circular(4.0),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4.0),
              ),
              filled: true,
              fillColor: Colors.white,
              contentPadding: const EdgeInsets.symmetric(horizontal: 15.0),
            ),
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
    );
  }
}

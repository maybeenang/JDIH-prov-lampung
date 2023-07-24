import 'package:flutter/material.dart';
import 'package:jdih/components/berita_item.dart';
import 'package:jdih/components/search_box.dart';
import 'package:jdih/styles/colors.dart';

class BeritaPage extends StatelessWidget {
  const BeritaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leadingWidth: 80,
          leading: IconButton.filled(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              style: ButtonStyle(
                backgroundColor: MaterialStateColor.resolveWith(
                    (states) => AppColors.textColor),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                ),
              )),
          toolbarHeight: 90,
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: Text('Berita',
                  style: TextStyle(
                      color: AppColors.textColor,
                      fontSize: 26,
                      fontWeight: FontWeight.w500)),
            ),
          ],
        ),
        body: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
              child: SearchBox(),
            ),
            Expanded(
              child: ListView.separated(
                separatorBuilder: (context, index) => const SizedBox(
                  height: 10,
                ),
                itemCount: 8,
                itemBuilder: (context, index) => BeritaItem(),
                padding: EdgeInsets.all(20.0),
              ),
            )
          ],
        ));
  }
}

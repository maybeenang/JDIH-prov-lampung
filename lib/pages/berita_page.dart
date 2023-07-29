import 'package:flutter/material.dart';
import 'package:jdih/components/appbar_page.dart';
import 'package:jdih/components/berita_item.dart';
import 'package:jdih/components/search_box.dart';

class BeritaPage extends StatelessWidget {
  const BeritaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBarPage("Berita", context),
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

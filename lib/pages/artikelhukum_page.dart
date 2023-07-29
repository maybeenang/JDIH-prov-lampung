import 'package:flutter/material.dart';
import 'package:jdih/components/appbar_page.dart';
import 'package:jdih/components/artikelhukum_item.dart';
import 'package:jdih/components/search_box.dart';

class ArtikelHukumPage extends StatelessWidget {
  const ArtikelHukumPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarPage("Artikel Hukum", context),
      body: SingleChildScrollView(
        child: Column(children: [
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: SearchBox(),
          ),
          ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            itemBuilder: (context, index) {
              return const ArtikelItem();
            },
            separatorBuilder: (context, index) {
              return const SizedBox(height: 20.0);
            },
            itemCount: 4,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
          )
        ]),
      ),
    );
  }
}

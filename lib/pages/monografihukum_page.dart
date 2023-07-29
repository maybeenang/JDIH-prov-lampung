import 'package:flutter/material.dart';
import 'package:jdih/components/appbar_page.dart';
import 'package:jdih/components/monografihukum_item.dart';
import 'package:jdih/components/search_box.dart';

class MonografiHukumPage extends StatelessWidget {
  const MonografiHukumPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarPage("Monografi Hukum", context),
      body: SingleChildScrollView(
        child: Column(children: [
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: SearchBox(),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 15,
                    crossAxisSpacing: 15,
                    childAspectRatio: 1 / 1.5),
                itemCount: 5,
                itemBuilder: (context, index) {
                  return const MonografiItem();
                }),
          )
        ]),
      ),
    );
  }
}

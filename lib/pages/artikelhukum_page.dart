import 'package:flutter/material.dart';
import 'package:jdih/components/artikelhukum_item.dart';
import 'package:jdih/components/search_box.dart';
import 'package:jdih/styles/colors.dart';

class ArtikelHukumPage extends StatelessWidget {
  const ArtikelHukumPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 90,
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
            child: Text('Artikel Hukum',
                style: TextStyle(
                    color: AppColors.textColor,
                    fontSize: 26,
                    fontWeight: FontWeight.w500)),
          ),
        ],
      ),
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

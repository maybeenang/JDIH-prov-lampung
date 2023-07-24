import 'package:flutter/material.dart';
import 'package:jdih/components/monografihukum_item.dart';
import 'package:jdih/components/search_box.dart';
import 'package:jdih/styles/colors.dart';

class MonografiHukumPage extends StatelessWidget {
  const MonografiHukumPage({super.key});

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
            child: Text('Monografi Hukum',
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

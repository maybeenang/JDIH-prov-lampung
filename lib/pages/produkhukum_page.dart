import 'package:flutter/material.dart';
import 'package:jdih/components/produkhukum_item.dart';
import 'package:jdih/components/search_box_produk.dart';
import 'package:jdih/styles/colors.dart';

class ProdukHukumPage extends StatefulWidget {
  const ProdukHukumPage({super.key});

  @override
  State<ProdukHukumPage> createState() => _ProdukHukumPageState();
}

class _ProdukHukumPageState extends State<ProdukHukumPage> {
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
              child: Text('Produk Hukum',
                  style: TextStyle(
                      color: AppColors.textColor,
                      fontSize: 26,
                      fontWeight: FontWeight.w500)),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Temukan Produk Hukum',
                      style: TextStyle(
                          color: AppColors.textColor,
                          fontSize: 24,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(height: 20.0),
                    SearchBoxProduk()
                  ],
                ),
              ),
              ListView.separated(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  itemBuilder: (context, index) {
                    return const ProdukItem();
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      height: 20,
                    );
                  },
                  itemCount: 10,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics()),
            ],
          ),
        ));
  }
}

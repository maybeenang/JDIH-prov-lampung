import 'package:flutter/material.dart';
import 'package:jdih/components/appbar_page.dart';
import 'package:jdih/components/produkhukum_item.dart';
import 'package:jdih/components/search_box_produk.dart';
import 'package:jdih/styles/colors.dart';
import 'package:jdih/utils/networking.dart';

class ProdukHukumPage extends StatefulWidget {
  const ProdukHukumPage({super.key});

  @override
  State<ProdukHukumPage> createState() => _ProdukHukumPageState();
}

class _ProdukHukumPageState extends State<ProdukHukumPage> {
  final _controller = ScrollController();
  List<dynamic> produkHukum = [];
  List<dynamic> produkHukumTemp = [];
  int page = 1;

  bool isLoading = false;

  Networking networking = Networking(params: 'produk-hukum?page=1&order=DESC');

  _getData() async {
    produkHukumTemp = await networking.getData();
    if (produkHukumTemp.isEmpty) {
      return;
    }
    if (this.mounted) {
      setState(() {
        produkHukum.addAll(produkHukumTemp);
        isLoading = false;
      });
    } else {
      return;
    }
  }

  @override
  void initState() {
    _getData();
    super.initState();
    _controller.addListener(() {
      if (_controller.position.pixels == _controller.position.maxScrollExtent) {
        if (isLoading) {
          return;
        }
        setState(() {
          isLoading = true;
        });
        page++;
        networking = Networking(params: 'produk-hukum?page=$page&order=DESC');
        _getData();
      }
    });
  }

  @override
  void dispose() {
    if (_controller.hasClients) _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBarPage('Produk Hukum', context),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          controller: _controller,
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
              produkHukum.isEmpty
                  ? const Center(
                      child: CircularProgressIndicator(
                      color: AppColors.textColor,
                    ))
                  : ListView.separated(
                      padding: const EdgeInsets.all(20.0),
                      itemBuilder: (context, index) {
                        if (index == produkHukum.length) {
                          return Center(
                            child: isLoading
                                ? const CircularProgressIndicator(
                                    color: AppColors.textColor,
                                  )
                                : const SizedBox(),
                          );
                        }
                        return ProdukItem(
                          data: [produkHukum[index]],
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(
                          height: 20,
                        );
                      },
                      itemCount: produkHukum.length + 1,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics()),
            ],
          ),
        ));
  }
}

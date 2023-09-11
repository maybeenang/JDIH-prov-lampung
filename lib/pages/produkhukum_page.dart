// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jdih/components/appbar_page.dart';
import 'package:jdih/components/search_box_produk.dart';
import 'package:jdih/providers/produkhukum_controller.dart';
import 'package:jdih/styles/colors.dart';

class ProdukHukumPage extends ConsumerStatefulWidget {
  const ProdukHukumPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ProdukHukumPageState createState() => _ProdukHukumPageState();
}

class _ProdukHukumPageState extends ConsumerState<ProdukHukumPage> {
  final _scrollController = ScrollController();
  bool loading = true;

  SnackBar snackbar(String word) {
    return SnackBar(
      content: Text(word),
      action: SnackBarAction(
        label: 'Tutup',
        onPressed: () {},
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(
      () {
        if (_scrollController.position.pixels ==
            _scrollController.position.maxScrollExtent) {}
      },
    );
    Future.delayed(const Duration(milliseconds: 500)).then((__) {
      setState(() {
        loading = false;
      });
    });
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(() {})
      ..dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final produkHukum = ref.watch(produkHukumControllerProvider);

    return Scaffold(
      appBar: appBarPage('Produk Hukum', context),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Text(
            'Temukan Produk Hukum',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColors.textColor,
            ),
          ),
          const SizedBox(height: 10),
          SearchBoxProduk(),
          const SizedBox(height: 20),
          produkHukum.maybeWhen(
            orElse: () {
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
            data: (data) {
              return ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(data![index].judul!),
                      subtitle: Text(data[index].no!),
                      onTap: () {
                        Navigator.pushNamed(context, '/produkhukum/detail',
                            arguments: data[index]);
                      },
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const Divider();
                  },
                  itemCount: data!.length);
            },
          ),
        ],
      ),
    );
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }
}

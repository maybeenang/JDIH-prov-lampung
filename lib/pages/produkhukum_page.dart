// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jdih/components/appbar_page.dart';
import 'package:jdih/components/produkhukum_item.dart';
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
            _scrollController.position.maxScrollExtent) {
          ref
              .read(produkHukumControllerProvider.notifier)
              .loadMoreProdukHukum();
        }
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
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Temukan Produk Hukum',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textColor,
                    ),
                  ),
                  SizedBox(height: 10),
                  SearchBoxProduk(),
                  SizedBox(height: 5),
                ],
              ),
            ),
          ),
          produkHukum.maybeWhen(
            orElse: () {
              return const SliverToBoxAdapter(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            },
            data: (data) {
              if (data == null) {
                return const SliverToBoxAdapter(
                  child: Center(
                    child: Text('Terjadi kesalahan'),
                  ),
                );
              }
              return SliverList.separated(
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: index < data.length
                        ? ProdukItem(data: data[index])
                        : const Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: const Center(
                              child: CircularProgressIndicator(),
                            ),
                          ),
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(height: 10);
                },
                itemCount: data.length + 1,
              );
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

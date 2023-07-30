import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jdih/bloc/produkhukum_bloc.dart';
import 'package:jdih/components/appbar_page.dart';
import 'package:jdih/components/produkhukum_item.dart';
import 'package:jdih/components/search_box_produk.dart';
import 'package:jdih/styles/colors.dart';

class ProdukHukumPage extends StatefulWidget {
  const ProdukHukumPage({super.key});

  @override
  State<ProdukHukumPage> createState() => _ProdukHukumPageState();
}

class _ProdukHukumPageState extends State<ProdukHukumPage> {
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
          if (context.read<ProdukhukumBloc>().state.status !=
              ProdukhukumStatus.failure) {
            context.read<ProdukhukumBloc>().add(ProdukhukumFetched());
          }
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
    return Scaffold(
      appBar: appBarPage('Produk Hukum', context),
      body: BlocConsumer<ProdukhukumBloc, ProdukhukumState>(
        listener: (context, state) {
          if (state.status == ProdukhukumStatus.failure) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(snackbar('Gagal memuat data'));
          }

          if (state.hasReachedMax) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(snackbar('Tidak ada data lagi'));
          }

          if (state.status == ProdukhukumStatus.initial ||
              state.status == ProdukhukumStatus.loading) {
            ScaffoldMessenger.of(context)..hideCurrentSnackBar();
          }
        },
        builder: (context, state) {
          return RefreshIndicator(
            onRefresh: () async {
              await Future.delayed(const Duration(seconds: 2));
              context.read<ProdukhukumBloc>().add(
                    ProdukhukumRefresh(
                      refreshController: context,
                    ),
                  );
            },
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              controller: _scrollController,
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
                  loading
                      ? const Center(child: CircularProgressIndicator())
                      : ListView.separated(
                          primary: false,
                          padding: const EdgeInsets.all(20.0),
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: state.hasReachedMax
                              ? state.produkHukum.length
                              : state.produkHukum.length + 1,
                          separatorBuilder: (context, index) {
                            return const SizedBox(
                              height: 20,
                            );
                          },
                          itemBuilder: (context, index) {
                            return index >= state.produkHukum.length
                                ? state.status == ProdukhukumStatus.loading
                                    ? const Center(
                                        child: CircularProgressIndicator())
                                    : state.status == ProdukhukumStatus.failure
                                        ? const Center(
                                            child: Text('Gagal memuat data'))
                                        : const SizedBox()
                                : ProdukItem(data: [state.produkHukum[index]]);
                          },
                        ),
                ],
              ),
            ),
          );
        },
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

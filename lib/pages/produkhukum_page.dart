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

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    Future.delayed(const Duration(milliseconds: 500)).then((__) {
      setState(() {
        loading = false;
      });
    });
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarPage('Produk Hukum', context),
      body: BlocBuilder<ProdukhukumBloc, ProdukhukumState>(
        builder: (context, state) {
          return RefreshIndicator(
            onRefresh: () {
              context.read<ProdukhukumBloc>().add(ProdukhukumFetched());
              return Future.delayed(const Duration(seconds: 1));
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
                                ? state.status == ProdukhukumStatus.failure
                                    ? const Center(
                                        child: Text('failed to fetch data'))
                                    : const Center(
                                        child: CircularProgressIndicator())
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

  void _onScroll() {
    if (_isBottom) {
      context.read<ProdukhukumBloc>().add(ProdukhukumFetched());
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }
}

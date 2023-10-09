import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jdih/components/appbar_page.dart';
import 'package:jdih/components/galery_item.dart';
import 'package:jdih/components/loading/loading_galery_item.dart';
import 'package:jdih/providers/galery_controller.dart';

class GaleriPage extends ConsumerWidget {
  const GaleriPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final galeryState = ref.watch(galeryControllerProvider);

    return Scaffold(
      appBar: appBarPage("Galeri", context),
      body: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 20.0,
            ),
          ),
          galeryState.when(data: (data) {
            if (data == null) {
              return const SliverToBoxAdapter(
                child: Center(
                  child: Text('Data tidak ditemukan'),
                ),
              );
            }

            return SliverList.separated(
              itemBuilder: (context, index) {
                return GaleryItem(
                  galery: data[index],
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(height: 20.0);
              },
              itemCount: data.length,
            );
          }, error: (error, stackTrace) {
            return SliverToBoxAdapter(
              child: Center(
                child: Text(error.toString()),
              ),
            );
          }, loading: () {
            return SliverList.separated(
              itemBuilder: (context, index) {
                return const LoadingGaleryItem();
              },
              separatorBuilder: (context, index) {
                return const SizedBox(height: 20.0);
              },
              itemCount: 6,
            );
          }),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 20.0,
            ),
          ),
        ],
      ),
    );
  }
}

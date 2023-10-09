import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jdih/components/appbar_page.dart';
import 'package:jdih/components/artikelhukum_item.dart';
import 'package:jdih/components/loading/loading_artikel_item.dart';
import 'package:jdih/components/search_box.dart';
import 'package:jdih/providers/artikel_controller.dart';

class ArtikelHukumPage extends HookConsumerWidget {
  const ArtikelHukumPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final artikelState = ref.watch(artikelControllerProvider);

    return Scaffold(
      appBar: appBarPage("Artikel Hukum", context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: SearchBox(),
            ),
            artikelState.when(
              data: (data) {
                if (data == null) {
                  return const Center(
                    child: Text('Data tidak ditemukan'),
                  );
                }

                return ListView.separated(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  itemBuilder: (context, index) {
                    return ArtikelItem(
                      artikel: data[index],
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(height: 20.0);
                  },
                  itemCount: data.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                );
              },
              error: (error, stackTrace) {
                return Center(
                  child: Text("Error: $error"),
                );
              },
              loading: () {
                return ListView.separated(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  itemBuilder: (context, index) {
                    return const LoadingArtikelItem();
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(height: 20.0);
                  },
                  itemCount: 3,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

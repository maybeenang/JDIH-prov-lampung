import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jdih/components/appbar_page.dart';
import 'package:jdih/components/berita_item.dart';
import 'package:jdih/components/loading/loading_berita_item.dart';
import 'package:jdih/components/search_box.dart';
import 'package:jdih/providers/berita_controller.dart';

class BeritaPage extends HookConsumerWidget {
  const BeritaPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final berita = ref.watch(beritaControllerProvider);

    return Scaffold(
        appBar: appBarPage("Berita", context),
        body: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
              child: SearchBox(),
            ),
            berita.maybeWhen(
              orElse: () {
                return Expanded(
                  child: ListView.separated(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return const LoadingBeritaItem();
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(height: 10.0);
                    },
                  ),
                );
              },
              data: (data) {
                if (data == null) {
                  return const Center(
                    child: Text("Data tidak ditemukan"),
                  );
                }
                return Expanded(
                  child: ListView.separated(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      return BeritaItem(
                        data: data[index],
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(height: 10.0);
                    },
                  ),
                );
              },
            )
          ],
        ));
  }
}

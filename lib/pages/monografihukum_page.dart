import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jdih/components/appbar_page.dart';
import 'package:jdih/components/monografihukum_item.dart';
import 'package:jdih/components/search_box.dart';
import 'package:jdih/providers/monografi_controller.dart';
import 'package:shimmer/shimmer.dart';

class MonografiHukumPage extends HookConsumerWidget {
  const MonografiHukumPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final monografiState = ref.watch(monografiControllerProvider);

    return Scaffold(
      appBar: appBarPage("Monografi Hukum", context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: SearchBox(),
            ),
            monografiState.maybeWhen(
              orElse: () {
                return Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 15,
                      crossAxisSpacing: 15,
                      childAspectRatio: 1 / 1.5,
                    ),
                    itemCount: 6,
                    itemBuilder: (context, index) {
                      return Shimmer.fromColors(
                        baseColor: Colors.grey[200]!,
                        highlightColor: Colors.grey[100]!,
                        enabled: true,
                        child: Container(
                          width: 300,
                          padding: const EdgeInsets.only(bottom: 10.0),
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black38),
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          ),
                        ),
                      );
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
                return Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 15,
                      crossAxisSpacing: 15,
                      childAspectRatio: 1 / 1.5,
                    ),
                    itemCount: 6,
                    itemBuilder: (context, index) {
                      return MonografiItem(
                        data: data[index],
                      );
                    },
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

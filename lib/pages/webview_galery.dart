import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jdih/styles/colors.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewGalery extends StatefulHookConsumerWidget {
  const WebViewGalery({super.key, required this.url});

  final String url;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _WebViewGaleryState();
}

class _WebViewGaleryState extends ConsumerState<WebViewGalery> {
  @override
  Widget build(BuildContext context) {
    final controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(widget.url))
      ..setBackgroundColor(AppColors.bgColor);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Galeri'),
      ),
      body: WebViewWidget(controller: controller),
    );
  }
}

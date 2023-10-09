import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jdih/styles/colors.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewMonografi extends StatefulHookConsumerWidget {
  const WebViewMonografi({super.key, required this.url});

  final String url;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _WebViewMonografiState();
}

class _WebViewMonografiState extends ConsumerState<WebViewMonografi> {
  @override
  Widget build(BuildContext context) {
    final controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(widget.url))
      ..setBackgroundColor(AppColors.bgColor);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Monografi Hukum'),
      ),
      body: WebViewWidget(controller: controller),
    );
  }
}

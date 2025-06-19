import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../controllers/streamlite_controller.dart';

class StreamliteView extends GetView<StreamliteController> {
  const StreamliteView({super.key});

  @override
  Widget build(BuildContext context) {
    // Inisialisasi controller untuk WebView
    final WebViewController webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(
        Uri.parse('https://visuali-basket.streamlit.app/'), 
      );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Streamlite'),
        centerTitle: true,
      ),
      body: WebViewWidget(
        controller: webViewController,
      ),
    );
  }
}

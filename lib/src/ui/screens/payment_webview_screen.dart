import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewContainer extends StatefulWidget {
  final String userId;
  final String amount;
  final String promoCode;
  final String tax_id;

  WebViewContainer({required this.userId, required this.amount,required this.promoCode, required this.tax_id});

  @override
  _WebViewContainerState createState() => _WebViewContainerState();
}

class _WebViewContainerState extends State<WebViewContainer> {
  final _webViewKey = UniqueKey();
  WebViewController? _webViewController;

  loadController() {
    _webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {
            
          },
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            print("hitting url--------"+request.url);
            if (request.url.startsWith('https://fighters11.com/paymentdone.php')) {
               Navigator.of(context).pop();
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse( widget.promoCode==''?  'https://fighters11.com/app/pay.php?userid=${widget.userId}&am=${widget.amount}&txn=${widget.tax_id}':'https://fighters11.com/app/pay.php?userid=${widget.userId}&am=${widget.amount}&promocode=${widget.promoCode}&txn=${widget.tax_id}'));
  }

  @override
  void initState() {
    super.initState();
    loadController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebViewWidget(controller: _webViewController!),
    );
  }
}

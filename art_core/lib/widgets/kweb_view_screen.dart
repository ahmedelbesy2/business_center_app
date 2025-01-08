import 'package:art_core/widgets/app_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:easy_localization/easy_localization.dart';
import '../theme/app_text_style.dart';

class KWebViewScreen extends StatefulWidget {
  const KWebViewScreen({super.key,
    required this.link,
    this.tittleAppBar
  });

  final String link;
  final String ?tittleAppBar;

  @override
  State<KWebViewScreen> createState() => _KWebViewScreenState();
}

class _KWebViewScreenState extends State<KWebViewScreen> {
  late WebViewController controller;
  bool isLoading = false;

  @override
  void initState() {
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (start) {
            setState(() {
              isLoading = true;
            });
          },
          onPageFinished: (String url) async {
            Future.delayed(const Duration(seconds: 2), () {
              setState(() {
                isLoading = false;
              });
            });
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.link));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          widget.tittleAppBar??"",maxLines: 1
          ,
          style: AppTextStyle.of(context).blackRegular16,
        ),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0,
      ),
      body: Stack(
        children: [
          WebViewWidget(controller: controller),
          isLoading
              ? Container(
                  height: MediaQuery.of(context).size.height,
                  alignment: Alignment.center,
                  color: Colors.white,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                            height: 100.h,
                            width: 100.w,
                            child: const AppLoader()),
                        Text(
                          "waiting".tr(),
                          style: AppTextStyle.of(context).blackBold16,
                        ),
                      ],
                    ),
                  ),
                )
              : Stack(),
        ],
      ),
    );
  }
}

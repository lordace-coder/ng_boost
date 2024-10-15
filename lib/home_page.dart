import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:ng_boost/constants.dart';
import 'package:ng_boost/error_page.dart';
import 'package:ng_boost/urls.dart';
import 'package:ng_boost/widgets.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = WebViewController();
  bool canGoBack = false;
  bool loading = false;
  int progress = 0;
  bool loadingError = false;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    controller.setJavaScriptMode(JavaScriptMode.unrestricted);
    controller.loadRequest(Uri.parse(Urls.homeUrl));
    controller.setNavigationDelegate(
      NavigationDelegate(
        onWebResourceError: (err) {
          // print('err occured ${err.errorType}');
          loadingError = true;
        },
        onHttpError: (err) {
// if(err){
//   loadingError = true;
// }
          print('err occured $err');
        },
        onPageStarted: (url) {
          if (url.contains('whatsapp')) {
            canLaunchUrl(Uri.parse(url)).then((canlaunch) {
              if (canlaunch) {
                launchUrl(Uri.parse(url));
              }
            });
          }
          setState(() {
            loading = true;
          });
        },
        onPageFinished: (url) {
          setState(() {
            loading = false;
          });
        },
        onProgress: (prog) {
          setState(() {
            progress = prog;
          });
        },
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  closeDrawer() {
    _scaffoldKey.currentState?.closeDrawer();
    // Navigator.of(_scaffoldKey.currentContext!).pop();
  }

  Widget gapW(double gap) {
    return SizedBox(
      width: gap,
    );
  }

  Widget gapH(double gap) {
    return SizedBox(
      height: gap,
    );
  }

  @override
  Widget build(BuildContext context) {
    controller.canGoBack().then((e) {
      setState(() {
        canGoBack = e;
      });
    });

    return PopScope(
      canPop: !canGoBack,
      onPopInvoked: (pop) {
        if (!pop) {
          controller.goBack();
        }
      },
      child: Scaffold(
        key: _scaffoldKey,
        drawer: Container(
          width: MediaQuery.of(context).size.width * (2 / 3),
          padding: const EdgeInsets.symmetric(horizontal: 10),
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //ng boost logo
              Padding(
                padding: const EdgeInsets.all(8),
                child: SizedBox(
                  height: 200,
                  child: Image.asset('assets/logo_txt.png'),
                ),
              ),
              GestureDetector(
                onTap: () {
                  closeDrawer();
                  controller.loadRequest(Uri.parse(Urls.homeUrl));
                },
                child: Row(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.home,
                      size: 14,
                    ),
                    gapW(10),
                    const Text(
                      'Home',
                      textAlign: TextAlign.end,
                    ),
                  ],
                ),
              ),
              const Divider(),
              GestureDetector(
                onTap: () {
                  closeDrawer();
                  controller.loadRequest(Uri.parse(Urls.funds));
                },
                child: Row(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.payment,
                      size: 14,
                    ),
                    gapW(10),
                    const Text(
                      'Fund Account',
                      textAlign: TextAlign.end,
                    ),
                  ],
                ),
              ),
              const Divider(),
              GestureDetector(
                onTap: () {
                  closeDrawer();
                  controller.loadRequest(Uri.parse(Urls.blog));
                },
                child: Row(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.newspaper,
                      size: 14,
                    ),
                    gapW(10),
                    const Text(
                      'Blog',
                      textAlign: TextAlign.end,
                    ),
                  ],
                ),
              ),
              const Divider(),
              GestureDetector(
                onTap: () {
                  closeDrawer();
                  controller.loadRequest(Uri.parse(Urls.blog));
                },
                child: Row(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.message,
                      size: 14,
                    ),
                    gapW(10),
                    const Text(
                      'Chat Support',
                      textAlign: TextAlign.end,
                    ),
                  ],
                ),
              ),
              const Divider(),
              GestureDetector(
                onTap: () {
                  closeDrawer();
                  controller.loadRequest(Uri.parse(Urls.affliates));
                },
                child: Row(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.people,
                      size: 14,
                    ),
                    gapW(10),
                    const Text(
                      'Affliate Referrals',
                      textAlign: TextAlign.end,
                    ),
                  ],
                ),
              ),
              const Divider(),
              GestureDetector(
                onTap: () {
                  closeDrawer();
                  controller.loadRequest(Uri.parse(Urls.settings));
                },
                child: Row(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.settings,
                      size: 14,
                    ),
                    gapW(10),
                    const Text(
                      'Account Settings',
                      textAlign: TextAlign.end,
                    ),
                  ],
                ),
              ),
              const Divider(),
              GestureDetector(
                onTap: () {
                  closeDrawer();
                  controller.loadRequest(Uri.parse(Urls.terms));
                },
                child: Row(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.abc,
                      size: 14,
                    ),
                    gapW(10),
                    const Text('Terms Of Service'),
                  ],
                ),
              ),
              const Divider(),
              GestureDetector(
                onTap: () {
                  closeDrawer();
                  controller.loadRequest(Uri.parse(Urls.child));
                },
                child: Row(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.newspaper,
                      size: 14,
                    ),
                    gapW(10),
                    const Text('Create Sub Site'),
                  ],
                ),
              ),
              const Divider(),
              GestureDetector(
                onTap: () {
                  closeDrawer();
                  showLicensePage(context: context);
                },
                child: Row(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.newspaper,
                      size: 14,
                    ),
                    gapW(10),
                    const Text('Show App Licences'),
                  ],
                ),
              ),
              const Divider(),
              gapH(10),
              const Text('NG Boost \nVersion:1.0.0'),
            ],
          ),
        ),
        appBar: CustomAppBar(
            loading: loading,
            loadingError: loadingError,
            controller: controller),
        body: Stack(
          children: [
            Column(
              children: [
                // progress bar
                if (loading)
                  LinearProgressIndicator(
                    color: Colors.red,
                    value: progress / 100,
                  ),
                // webview
                Expanded(
                  child: WebViewWidget(
                    controller: controller,
                    gestureRecognizers: {
                      Factory<VerticalDragGestureRecognizer>(
                          () => VerticalDragGestureRecognizer()),
                      Factory<HorizontalDragGestureRecognizer>(
                          () => HorizontalDragGestureRecognizer()),
                      Factory<TapGestureRecognizer>(
                          () => TapGestureRecognizer()),
                    },
                  ),
                )
              ],
            ),
            if (loading)
              const Positioned(
                top: 0,
                left: 0,
                right: 0,
                bottom: 0,
                child: LoadingBox(),
              ),
            if (loadingError)
              Positioned(
                  child: ErrorScreen(
                reload: () async {
                  await controller.reload();
                  setState(() {
                    loadingError = false;
                  });
                },
                loadHome: () async {
                  await controller.loadRequest(Uri.parse(Urls.homeUrl));
                },
              ))
          ],
        ),
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.loading,
    required this.loadingError,
    required this.controller,
  });

  final bool loading;
  final bool loadingError;
  final WebViewController controller;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragDown: (x) {
        controller.reload();
      },
      child: AppBar(
        backgroundColor: primary,
        foregroundColor: Colors.white,
        actions: [
          if (!loading && !loadingError)
            IconButton(
              onPressed: () {
                controller.reload();
              },
              icon: const Icon(CupertinoIcons.refresh),
            )
          // else
          //   const Padding(
          //     padding: EdgeInsets.all(8.0),
          //     child: SizedBox(
          //       height: 20,
          //       width: 20,
          //       child: CircularProgressIndicator.adaptive(
          //         valueColor: AlwaysStoppedAnimation<Color>(
          //             Color.fromARGB(133, 255, 255, 255)),
          //       ),
          //     ),
          //   )
        ],
        title: GestureDetector(
            onTap: () {
              controller.loadRequest(Uri.parse(Urls.homeUrl));
            },
            child: const Text('NGBoost')),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

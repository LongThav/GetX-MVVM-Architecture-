import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/db_helper/cache_token.dart';
import 'package:project/view/index_view.dart';
import 'package:project/view/login_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  final CacheToken _cacheToken = CacheToken();
  void init() async {
    String token = await _cacheToken.getToken();
    debugPrint("Token: $token");
    if (token == _cacheToken.noKeyToken) {
      Future.delayed(const Duration(milliseconds: 600), () {
        Get.offAll(()=>const LoginView());
      });
    } else {
      Future.delayed(const Duration(milliseconds: 600), () {
        Get.offAll(()=>const IndexView());
      });
    }
  }

  @override
  void initState() {
    init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Splash View"),
      ),
    );
  }
}

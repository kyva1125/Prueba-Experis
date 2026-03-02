import 'package:flutter/material.dart';

import '../../../routes/routes.dart';
import '../controller/splash_provider.dart';


class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    _start();
  }

  Future<void> _start() async {
   final value = await splashProvider.read().init();




    await Future.delayed(Duration(seconds: 3));

    if (!mounted) return;
    Navigator.pushReplacementNamed(context, Routes.HOME);
  }

  @override
  Widget build(BuildContext context) {
    return const Text("SPLASH SCREEN");
  }
}

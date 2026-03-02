import 'package:flutter_meedu/providers.dart';
import 'splash_controller.dart';

final splashProvider = Provider.state(
  (_) => SplashController(""),
);

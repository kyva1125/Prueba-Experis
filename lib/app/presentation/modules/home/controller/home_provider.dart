import 'package:flutter_meedu/providers.dart';

import '../../../../inject_dependencies.dart';
import 'home_controller.dart';

final homeProvider = Provider.state(
  (_) => HomeController(peliculasRepository:  peliculasProvider.read() ),
);

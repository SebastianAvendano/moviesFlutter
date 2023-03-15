import 'package:jiffy/jiffy.dart';
import 'di_config.dart';

Future<void> initalConfig() async {
  await Jiffy.locale('es');
  await configureDIDependencies();
}
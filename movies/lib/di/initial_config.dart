import 'package:dio/dio.dart';
import 'di_config.dart';

Future<void> initalConfig() async {
  await configureDIDependencies();
  Dio();
}
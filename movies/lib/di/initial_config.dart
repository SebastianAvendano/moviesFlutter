import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'di_config.dart';

Future<void> initalConfig() async {
  await Firebase.initializeApp();
  await configureDIDependencies();
  Dio();
}
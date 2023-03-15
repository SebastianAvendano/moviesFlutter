import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'di_config.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: r'$initGetIt',
  preferRelativeImports: true,
  asExtension: false,
)
Future<GetIt> configureDIDependencies() async => $initGetIt(getIt);

@module
abstract class AppModule {
  @lazySingleton
  Logger get logger => Logger();
  
  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();
}
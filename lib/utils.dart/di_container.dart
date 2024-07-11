import 'package:get_it/get_it.dart';
import 'package:learning_words/database/database.dart';
import 'package:learning_words/repository/repository.dart';

class DIContainer {
  static Future<void> init() async {
    final db = AppDatabase();

    registerNew<AppDatabase>(db);
    registerNew<Repository>(Repository(GetIt.I.get()));
  }
}

T shared<T extends Object>({
  String? instanceName,
  dynamic param1,
  dynamic param2,
}) =>
    GetIt.I.get<T>(
      instanceName: instanceName,
      param1: param1,
      param2: param2,
    );

registerNew<T extends Object>(T instance) async {
  final getIt = GetIt.I;
  if (getIt.isRegistered<T>()) {
    getIt.unregister<T>();
  }
  getIt.registerSingleton<T>(instance);
}

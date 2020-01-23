import 'package:clean_architecture_flutter/app/infrastucture/di/controller_module.dart';
import 'package:clean_architecture_flutter/app/infrastucture/di/mapper_module.dart';
import 'package:clean_architecture_flutter/app/infrastucture/di/presenter_module.dart';
import 'package:clean_architecture_flutter/app/infrastucture/di/repository_module.dart';
import 'package:clean_architecture_flutter/app/infrastucture/di/root_module.dart';
import 'package:clean_architecture_flutter/app/infrastucture/di/usecase_module.dart';
import 'package:injector/injector.dart';

class AppComponent {

  static void init() {
    Injector injector = getInjector();
    RootModule.init(injector);
    MapperModule.init(injector);
    RepositoryModule.init(injector);
    UsecaseModule.init(injector);
    PresenterModule.init(injector);
    ControllerModule.init(injector);
  }

  static Injector getInjector() {
    return Injector.appInstance;
  }
}
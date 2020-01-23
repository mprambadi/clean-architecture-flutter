
import 'package:clean_architecture_flutter/app/ui/pages/home/controller.dart';
import 'package:clean_architecture_flutter/app/ui/pages/home/presenter.dart';
import 'package:injector/injector.dart';

class ControllerModule {
  static init(Injector injector){

    
    injector.registerDependency<HomeController>((Injector injector){
      return HomeController(injector.getDependency<HomePresenter>());
    });
    
  }
}
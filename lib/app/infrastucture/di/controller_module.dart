
import 'package:clean_architecture_flutter/app/ui/pages/home/controller.dart';
import 'package:clean_architecture_flutter/app/ui/pages/home/presenter.dart';
import 'package:clean_architecture_flutter/app/ui/pages/post/controller.dart';
import 'package:clean_architecture_flutter/app/ui/pages/post/presenter.dart';
import 'package:injector/injector.dart';

class ControllerModule {
  static init(Injector injector){

    
    injector.registerDependency<HomeController>((Injector injector){
      return HomeController(injector.getDependency<HomePresenter>());
    });
    injector.registerDependency<PostController>((Injector injector){
      return PostController(injector.getDependency<PostPresenter>());
    });
    
  }
}
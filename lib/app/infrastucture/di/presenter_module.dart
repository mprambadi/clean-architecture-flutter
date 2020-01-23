
import 'package:clean_architecture_flutter/app/ui/pages/home/presenter.dart';
import 'package:clean_architecture_flutter/use_cases/user/get_user.dart';
import 'package:injector/injector.dart';

class PresenterModule {
  static init(Injector injector){

    
    injector.registerDependency<HomePresenter>((Injector injector){
      return HomePresenter(injector.getDependency<GetUserUseCase>());
    });
    
  }
}
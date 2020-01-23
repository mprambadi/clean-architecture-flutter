
import 'package:clean_architecture_flutter/app/ui/pages/home/presenter.dart';
import 'package:clean_architecture_flutter/app/ui/pages/post/presenter.dart';
import 'package:clean_architecture_flutter/use_cases/post/get_post.dart';
import 'package:clean_architecture_flutter/use_cases/user/get_user.dart';
import 'package:injector/injector.dart';

class PresenterModule {
  static init(Injector injector){

    
    injector.registerDependency<HomePresenter>((Injector injector){
      return HomePresenter(injector.getDependency<GetUserUseCase>());
    });
    injector.registerDependency<PostPresenter>((Injector injector){
      return PostPresenter(injector.getDependency<GetPostUseCase>());
    });
  }
}
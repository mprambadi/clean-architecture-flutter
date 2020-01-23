
import 'package:clean_architecture_flutter/app/repository/api/post_api_repository.dart';
import 'package:clean_architecture_flutter/app/repository/api/user_api_repository.dart';
import 'package:clean_architecture_flutter/use_cases/post/get_post.dart';
import 'package:clean_architecture_flutter/use_cases/user/get_user.dart';
import 'package:injector/injector.dart';

class UsecaseModule {
  static init(Injector injector){

    injector.registerDependency<GetUserUseCase>((Injector injector){
      return GetUserUseCase(injector.getDependency<UserApiRepository>());
    });
    injector.registerDependency<GetPostUseCase>((Injector injector){
      return GetPostUseCase(injector.getDependency<PostApiRepository>());
    });
    
  }
}
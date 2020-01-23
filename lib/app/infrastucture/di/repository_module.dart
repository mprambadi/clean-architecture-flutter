
import 'package:clean_architecture_flutter/app/infrastucture/endpoint.dart';
import 'package:clean_architecture_flutter/app/infrastucture/persistences/api_services.dart';
import 'package:clean_architecture_flutter/app/repository/api/post_api_repository.dart';
import 'package:clean_architecture_flutter/app/repository/api/user_api_repository.dart';
import 'package:clean_architecture_flutter/data/persistences/mappers/post_mapper.dart';
import 'package:clean_architecture_flutter/data/persistences/mappers/user_mapper.dart';
import 'package:injector/injector.dart';

class RepositoryModule {
  static init(Injector injector){
    
    injector.registerDependency<UserApiRepository>((Injector injector){
      return UserApiRepository(
        injector.getDependency<ApiService>(),
        injector.getDependency<Endpoints>(),
        injector.getDependency<UserMapper>()
        );
    });
    injector.registerDependency<PostApiRepository>((Injector injector){
      return PostApiRepository(
        injector.getDependency<ApiService>(),
        injector.getDependency<Endpoints>(),
        injector.getDependency<PostMapper>()
        );
    });
    
  }
}
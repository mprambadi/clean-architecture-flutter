
import 'package:clean_architecture_flutter/data/persistences/mappers/user_mapper.dart';
import 'package:injector/injector.dart';

class MapperModule {
  static init(Injector injector){
    
    injector.registerSingleton<UserMapper>((_)=> UserMapper());
    
  }
}
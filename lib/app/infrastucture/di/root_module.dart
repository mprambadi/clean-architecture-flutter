
import 'package:clean_architecture_flutter/app/infrastucture/endpoint.dart';
import 'package:clean_architecture_flutter/app/infrastucture/persistences/api_services.dart';
import 'package:dio/dio.dart';
import 'package:injector/injector.dart';

class RootModule {
  static init(Injector injector){

    injector.registerSingleton<Endpoints>((_) => Endpoints("https://jsonplaceholder.typicode.com"));

    injector.registerDependency<Dio>((Injector injector){
      var dio = Dio();

      var endpoints = injector.getDependency<Endpoints>();

      dio.options.baseUrl = endpoints.baseUrl;

      return dio;
    });
    injector.registerDependency<ApiService>((Injector injector){
      return ApiService(injector.getDependency<Dio>());
    });


  }
}
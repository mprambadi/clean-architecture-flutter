
// Here for the business logic of the entity
import 'package:clean_architecture_flutter/app/infrastucture/endpoint.dart';
import 'package:clean_architecture_flutter/app/infrastucture/persistences/api_services.dart';
import 'package:clean_architecture_flutter/data/infrastructures/api_services_interface.dart';
import 'package:clean_architecture_flutter/data/persistences/mappers/user_mapper.dart';
import 'package:clean_architecture_flutter/data/persistences/repositories/contracts/user_repository.dart';
import 'package:clean_architecture_flutter/domains/entities/user.dart';
import 'package:dio/dio.dart';

class UserApiRepository implements UserRepository {
  UserMapper _mapper;
  ApiServiceInterface _service;
  Endpoints _endpoints;

  UserApiRepository(ApiService service, Endpoints endpoints, UserMapper mapper) {
    _mapper = mapper;
    _service = service;
    _endpoints = endpoints;
  }

  Future<List<User>> show() async {
    var resp;
    try {
       resp = await _service.invokeHttp(_endpoints.user(), RequestType.get);
    } catch (error) {
      rethrow;
    }
      return _mapper.getUserApiConverter(resp);
  }
}
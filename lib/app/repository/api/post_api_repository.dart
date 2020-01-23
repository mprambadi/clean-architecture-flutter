
// Here for the business logic of the entity
import 'package:clean_architecture_flutter/app/infrastucture/endpoint.dart';
import 'package:clean_architecture_flutter/data/infrastructures/api_services_interface.dart';
import 'package:clean_architecture_flutter/data/persistences/mappers/post_mapper.dart';
import 'package:clean_architecture_flutter/data/persistences/repositories/contracts/post_repository.dart';
import 'package:clean_architecture_flutter/domains/entities/posts.dart';

class PostApiRepository implements PostRepository {
  PostMapper _mapper;
  ApiServiceInterface _service;
  Endpoints _endpoints;

  PostApiRepository(ApiServiceInterface service, Endpoints endpoints, PostMapper mapper) {
    _mapper = mapper;
    _service = service;
    _endpoints = endpoints;
  }

  @override
  Future<List<Post>> show() async {
    var resp;
    try {
       resp = await _service.invokeHttp(_endpoints.post(), RequestType.get);
    } catch (error) {
      rethrow;
    }
      return _mapper.getUserApiConverter(resp);
  }


}
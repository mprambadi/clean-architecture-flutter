import 'dart:async';

import 'package:clean_architecture_flutter/app/repository/api/post_api_repository.dart';
import 'package:clean_architecture_flutter/domains/entities/posts.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

// Declaring usecase of the entity
class GetPostUseCase extends UseCase<List<Post>, void> {
  final PostApiRepository _repository; 

  GetPostUseCase(this._repository);

  @override
  Future<Stream<List<Post>>> buildUseCaseStream(void ignore) async {
    final StreamController<List<Post>> controller = new StreamController();
    try {
      List<Post> post = await _repository.show();
      controller.add(post);
      controller.close();
    } catch (e) {
      print(e);
      controller.addError(e);
    }
    return controller.stream;
  }
}

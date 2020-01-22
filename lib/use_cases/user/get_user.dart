import 'dart:async';

import 'package:clean_architecture_flutter/app/repository/api/user_api_repository.dart';
import 'package:clean_architecture_flutter/domains/entities/user.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

// Declaring usecase of the entity
class GetUserUseCase extends UseCase<List<User>, void> {
  final UserApiRepository _repository; 

  GetUserUseCase(this._repository);

  @override
  Future<Stream<List<User>>> buildUseCaseStream(void ignore) async {
    final StreamController<List<User>> controller = new StreamController();
    try {
      List<User> user = await _repository.show();
      controller.add(user);
      controller.close();
    } catch (e) {
      print(e);
      controller.addError(e);
    }
    return controller.stream;
  }
}


import 'package:clean_architecture_flutter/domains/entities/user.dart';

abstract class UserRepository {
  Future<List<User>> show();
}

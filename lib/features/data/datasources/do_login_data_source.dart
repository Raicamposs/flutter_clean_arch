import '../../../features/data/models/index.dart';

abstract class DoLoginDataSource {
  Future<UserModel> doLogin({required String email, required String password});
}

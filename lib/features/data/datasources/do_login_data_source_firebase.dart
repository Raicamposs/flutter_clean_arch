import '../../../core/error/index.dart';
import '../../../features/data/models/index.dart';

import 'do_login_data_source.dart';

class DoLoginDataSourceFirebase extends DoLoginDataSource {
  @override
  Future<UserModel> doLogin({required String email, required String password}) {
    try {
      return Future.value(UserModel.fromFirebase({
        'name': 'Edson Raimundo Melo',
        'picture_url': 'https://avatars.dicebear.com/api/bottts/.svg',
        'email': 'edsonraimundomelo_@vcp.com.br',
        'born_date': DateTime(1955, 01, 15).toIso8601String(),
      }));
    } catch (_) {
      throw ServerFailure();
    }
  }
}

import 'package:applycamp/data/source/user_data_source.dart';
import 'package:applycamp/domain/repository/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserDataSource dataSource;

  UserRepositoryImpl(this.dataSource);

  @override
  Future getDashboard() async => dataSource.getDashboard();
}

import 'package:applycamp/core/common/dio_consumer.dart';
import 'package:applycamp/core/constant/remote_constant.dart';

abstract class UserDataSource {
  Future getDashboard();
}

class UserDataSourceImpl implements UserDataSource {
  final PortalDioConsumer dioConsumer;

  UserDataSourceImpl(this.dioConsumer);

  @override
  Future getDashboard() async {
    final response = await dioConsumer.get(PortalRemoteConstants.dashboard);
  }
}

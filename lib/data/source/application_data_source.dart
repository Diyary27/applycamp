import 'package:applycamp/core/common/dio_consumer.dart';

abstract class ApplicationDataSource {
  Future getApplicationsByStudent(int id);
}

class ApplicationDataSourceImpl implements ApplicationDataSource {
  final PortalDioConsumer dioConsumer;

  ApplicationDataSourceImpl(this.dioConsumer);

  @override
  Future getApplicationsByStudent(int id) {
    // TODO: implement getApplicationsByStudent
    throw UnimplementedError();
  }
}

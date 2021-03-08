import 'package:vexana/vexana.dart';

import '../model/reqres_model.dart';

abstract class IUserService {
  final INetworkManager networkManager;

  IUserService({required this.networkManager});

  Future<List<Data>> fetchUserData({int page = 0});
}

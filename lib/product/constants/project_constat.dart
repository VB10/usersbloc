import 'package:vexana/vexana.dart';

import '../utilty/network_route.dart';

class ProjectConstants {
  static ProjectConstants? _instace;
  static ProjectConstants get instance {
    _instace ??= ProjectConstants._init();
    return _instace!;
  }

  INetworkManager networkManager = NetworkManager(
    isEnableLogger: true,
    options: BaseOptions(baseUrl: NetworkRoute.BASE_URL.rawValue),
  );

  ProjectConstants._init();
}

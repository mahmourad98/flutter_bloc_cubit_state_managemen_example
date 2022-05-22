import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectivityService{
  final _connectivity = Connectivity();
  final connectivityStreamController = StreamController();

  ConnectivityService(){
    _connectivity.onConnectivityChanged.listen(
      (event) {
        connectivityStreamController.add(event);
      }
    );
  }
}
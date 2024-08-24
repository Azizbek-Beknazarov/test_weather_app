import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class NetworkInfo {
  Future<bool> get isConnection;
}

class NetworkInfoImple implements NetworkInfo {
  final InternetConnectionChecker checker;

  NetworkInfoImple({required this.checker});

  @override
  Future<bool> get isConnection => checker.hasConnection;
}

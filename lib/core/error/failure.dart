import 'package:equatable/equatable.dart';

abstract class FailureErr extends Equatable {
  @override
  List<Object> get props => [];
}

class ServerFailureErr extends FailureErr {
  final String message;

  ServerFailureErr({required this.message});
}

class InternetFailureErr extends FailureErr {
  final String message;

  InternetFailureErr({required this.message});
}

class InvalidInputFailureErr extends FailureErr {
  final String message;

  InvalidInputFailureErr({required this.message});
}

class LocationDisabledFailureErr extends FailureErr {}

class LocationPermessionFailureErr extends FailureErr {}

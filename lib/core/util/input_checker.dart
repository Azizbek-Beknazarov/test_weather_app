import 'package:dartz/dartz.dart';
import 'package:test_weather_app/core/error/failure.dart';
import 'package:test_weather_app/core/util/constants.dart';

class InputChecker {
  Either<FailureErr, String> checkOfStringInput(String value) {
    value = value.toLowerCase().trim();

    List<String> values = value.split(" ");
    RegExp expLower = RegExp(r'^[a-z]+$');

    for (String val in values) {
      if (!expLower.hasMatch(val)) {
        return Left(
            InvalidInputFailureErr(message: Constants.INVALID_INPUT_FAIL_MESSAGE));
      }
    }
    return Right(value.trim());
  }
}

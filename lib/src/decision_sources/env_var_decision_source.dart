import '../../feature_flag.dart';

class EnvironmentVariableDecisionSource {
  StateResult<BinaryFeatureState> Function() fromVariable(String varName) {
    return () {
      // TODO: implement actual logic
      return StateResult<BinaryFeatureState>.fallthrough();
    };
  }
}
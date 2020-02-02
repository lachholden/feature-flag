import '../../feature_flag.dart';

class EnvironmentVariableDecisionSource {
  StateResult<BinaryFeatureState> Function() fromVariable(String var_name) {
    return () {
      // TODO: implement actual logic
      return StateResult.fallthrough();
    };
  }
}
import '../../feature_flag.dart';

/// A decision source based on environment variables.
/// 
/// {@category Decision Sources}
class EnvironmentVariableDecisionSource {
  StateResult<BinaryFeatureState> Function() fromVariable(String varName) {
    return () {
      // TODO: implement actual logic
      return StateResult<BinaryFeatureState>.fallthrough();
    };
  }
}
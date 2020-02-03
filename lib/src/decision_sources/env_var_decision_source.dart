import 'dart:io' show Platform;
import '../../feature_flag.dart';

/// A binary decision source that uses environment variables to determine whether or not to enable
/// a feature.
/// 
/// {@category Decision Sources}
class EnvironmentVariableDecisionSource {
  /// Returns a decision function that checks the environment variable `varName` to determine a
  /// feature's state.
  /// 
  /// If the value of the environment variable named `varName` is any of (case insensitive):
  /// * 'true', 't', 'enable', 'enabled', 'on', 'yes', 'y', '1': the feature is enabled, or if it's
  /// * 'false', 'f', 'disable', 'disabled', 'off', 'no', 'n', '0': the feature is disabled, or otherwise
  /// * the decision function falls through
  DecisionFunction<BinaryFeatureState> checkVariable(String varName) {
    return () {
      final String variable = Platform.environment[varName].toUpperCase();
      switch (variable) {
        case 'TRUE':
        case 'T':
        case 'ENABLE':
        case 'ENABLED':
        case 'ON':
        case 'YES':
        case 'Y':
        case '1':
          return StateResult<BinaryFeatureState>.state(BinaryFeatureState.enabled);
          break;
        
        case 'FALSE':
        case 'F':
        case 'DISABLE':
        case 'DISABLED':
        case 'OFF':
        case 'NO':
        case 'N':
        case '0':
          return StateResult<BinaryFeatureState>.state(BinaryFeatureState.disabled);
          break;
        
        default:
          return StateResult<BinaryFeatureState>.fallthrough();
          break;
      }
    };
  }
}
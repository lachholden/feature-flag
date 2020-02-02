import '../feature_flag.dart';

/// Represents a single feature that can be one of multiple states.
/// 
/// The feature's state will be of the type `StateOption`.
class Feature<StateOption> {
  Feature({this.name, this.defaultState, this.decisionSources});

  /// The name of the feature, which is primarily used for debugging.
  String name;

  List<StateResult<StateOption> Function()> decisionSources;

  /// The default state of the feature, used if all of the feature's decision sources fallthrough.
  StateOption defaultState;

  /// Get the state of the feature by evaluating each of the decision sources in turn and returning
  /// the state of the first one to not fall through, or the default value if they all fall through.
  StateOption get state {
    for (var decision in decisionSources) {
      final StateOption r = decision().join(
        (fallthrough) => null, 
        (result) => result.state,
      );

      if (r != null) {
        return r;
      }
    }

    // All of the decisions fell through.
    return defaultState;
  }
}

/// Allows the syntactic sugar `.enabled` and `.disabled` for binary features. 
extension BinaryShortcuts on Feature<BinaryFeatureState> {
  bool get enabled {
    return this.defaultState == BinaryFeatureState.enabled;
  }

  bool get disabled {
    return this.defaultState == BinaryFeatureState.disabled;
  }
}
import '../feature_flag.dart';

/// Represents a single feature that can be one of multiple states.
/// 
/// The feature's state will be of the type `StateOption`.
class Feature<StateOption> {
  Feature({this.name, this.defaultState});

  /// The name of the feature, which is primarily used for debugging.
  String name;

  /// The default state of the feature, used if all of the feature's [DecisionSource]s fallthrough.
  StateOption defaultState;

  StateOption get state {
    throw UnimplementedError;
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
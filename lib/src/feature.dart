import '../feature_flag.dart';

/// Represents a single feature that can be one of multiple states.
/// 
/// The generic parameter `State` should most likely be an enum, like [BinaryFeatureState], for
/// example.
class Feature<State> {
  Feature({this.name, this.defaultState});

  String name;
  State defaultState;

  State get state {
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
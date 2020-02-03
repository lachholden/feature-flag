import '../feature_flag.dart';

typedef StateResult<T> DecisionFunction<T>();

/// Represents a single feature that can be one of multiple states.
///
/// The feature's state will be of the type `StateOption`. The feature's state, when accessed, is
/// decided by a list of [DecisionFunction]s evaluated in turn. The result of the first
/// [DecisionFunction] in [decisionSources] that returns a [StateResult]`.state(...)` is returned as
/// the feature's state. If all [decisionSources] return a [StateResult]`.fallthrough()`, then
/// [defaultState] is returned instead.
///
/// The most common form of this class is [Feature<BinaryFeatureState>], which represents a feature
/// that is either enabled or disabled. It's recommended that `StateOption` be an enum, as this
/// ensures switch statements when used for control flow are exhaustive.
class Feature<StateOption> {
  Feature({this.name, this.defaultState, this.decisionSources});

  /// The name of the feature, which is primarily used for debugging.
  String name;

  /// The list of decision sources to consider when deciding the state of the feature.
  ///
  /// The feature's state is the return value of the first source to return a
  /// [StateResult]`.state(...)` result.
  List<DecisionFunction<StateOption>> decisionSources;

  /// The default state of the feature, used if all of the feature's decision sources fallthrough.
  StateOption defaultState;

  /// Get the state of the feature by evaluating each of the decision sources in turn and returning
  /// the state of the first one to not fall through, or the default value if they all fall through.
  StateOption get state {
    // So there's no error if no sources were specified.
    decisionSources = decisionSources ?? <DecisionFunction<StateOption>>[];

    for (final DecisionFunction<StateOption> decision in decisionSources) {
      final StateResult<StateOption> r = decision();
      if (r.isState) {
        return r.state;
      }
    }

    // All of the decisions fell through.
    return defaultState;
  }
}

/// Allows the syntactic sugar `.enabled` and `.disabled` for binary features.
extension BinaryShortcuts on Feature<BinaryFeatureState> {
  bool get enabled {
    return state == BinaryFeatureState.enabled;
  }

  bool get disabled {
    return state == BinaryFeatureState.disabled;
  }
}

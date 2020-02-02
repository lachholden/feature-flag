import '../../feature_flag.dart';

/// Implemented by classes representing a source of decisions regarding the state of a feature.
/// 
/// The simplest use of this library involves creating [Feature]s with a `defaultState`, and
/// updating that value in code when a feature flag should be toggled. Classes implementing this
/// one can be used as alternative sources of decisions regarding the state of a feature, by reading
/// the state from an environment variable or a web API, for example.
abstract class DecisionSource<StateOption> {
  StateResult<StateOption> getStateResult(FeatureManager manager, Feature feature);
}
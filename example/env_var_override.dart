import 'package:feature_flag/feature_flag.dart';
import 'package:feature_flag/src/decision_sources/env_var_decision_source.dart';

// Create the feature manager
final FeatureManager featureManager = FeatureManager();

// Create the decision source
final EnvironmentVariableDecisionSource envVarDecisionSource = EnvironmentVariableDecisionSource();

// Register the features
final puppyParty = featureManager.registerBinaryFeature(
  'puppyParty',
  defaultState: BinaryFeatureState.enabled,
  decisionSources: [
    envVarDecisionSource.fromVariable('ENABLE_PUPPIES'),
  ],
);

// Use the features in code
void main() {
  if (puppyParty.enabled) {
    print('Yay! A puppy party!');
  } else {
    print('nothing to see here...');
  }
}

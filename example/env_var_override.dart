import 'package:feature_flag/feature_flag.dart';
import 'package:feature_flag/src/decision_sources/env_var_decision_source.dart';

// Create the decision source
final EnvironmentVariableDecisionSource envVarDecisionSource = EnvironmentVariableDecisionSource();

// Register the features
final Feature<BinaryFeatureState> puppyParty = Feature<BinaryFeatureState>(
  name: 'puppyParty',
  defaultState: BinaryFeatureState.enabled,
  decisionSources: <StateResult<BinaryFeatureState> Function()>[
    envVarDecisionSource.checkVariable('ENABLE_PUPPIES'),
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

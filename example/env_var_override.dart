import 'package:feature_flag/feature_flag.dart';

// Create the decision source
final EnvironmentVariableDecisionSource envVarDecisionSource =
    EnvironmentVariableDecisionSource();

// Register the features
final Feature<BinaryFeatureState> puppyParty = Feature<BinaryFeatureState>(
  name: 'puppyParty',
  defaultState: BinaryFeatureState.disabled,
  decisionSources: <DecisionFunction<BinaryFeatureState>>[
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

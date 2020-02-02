import 'package:feature_flag/feature_flag.dart';

// Create the feature manager
final FeatureManager featureManager = FeatureManager();

// Register the features
final puppyParty = featureManager.registerBinaryFeature(
  'puppyParty',
  defaultState: BinaryFeatureState.enabled,
);

// Use the features in code
void main() {
  if (puppyParty.enabled) {
    print('Yay! A puppy party!');
  } else {
    print('nothing to see here...');
  }
}

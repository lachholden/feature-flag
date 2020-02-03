Features can be supercharged through the use of *decision sources*, which allow the decisions regarding the state of a feature to be influenced by a variety of sources. For example, you could have a feature disabled by default, except it's enabled when a specific environment variable is set or when a web API returns a certain response or after a certain date has passed, or any combination of these in priority order.

Extending the above example to load feature state from an environment variable could look like:

###### `features.dart`
```dart
import 'package:feature_flag/feature_flag.dart';

// Create the decision source
final EnvironmentVariableDecisionSource envVarDecisionSource = EnvironmentVariableDecisionSource();

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
```

###### Result
```console
$ dart main.dart
nothing to see here...

$ ENABLE_PUPPIES=false main.dart
nothing to see here...

$ ENABLE_PUPPIES=true main.dart
Yay! A puppy party!
```
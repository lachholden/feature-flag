# Feature Flag
<p align="center">
  <a href="https://travis-ci.org/lachholden/feature-flag"><img alt="Travis (.org) branch" src="https://img.shields.io/travis/lachholden/feature-flag/master"></a>
<p>

A [dart](https://dart.dev) package that provides feature flags that can be enabled and disabled by a variety of methods.

## Rationale
Some recommended reading:

* [Use cases for feature flags](http://featureflags.io/feature-flag-uses/) by featureflags.io
* [Feature Toggles (aka Feature Flags)](https://martinfowler.com/articles/feature-toggles.html) by Martin Fowler

## Basic Example
This is a basic example of a binary (enabled/disabled) flag with a default value only.

###### `mypackage/lib/features.dart`
```dart
import 'package:feature_flag/feature_flag.dart';

final Feature<BinaryFeatureState> puppyParty = Feature<BinaryFeatureState>(
  name: 'puppyParty',
  defaultState: BinaryFeatureState.enabled,
);
```

###### `mypackage/lib/main.dart`
```dart
import './features.dart' as features;

void main() {
  if (features.puppyParty.enabled) {
    print('Yay! A puppy party!');
  } else {
    print('nothing to see here...');
  }
}
```

## Going Further
Features can be supercharged through the use of *decision sources*, which allow the decisions regarding the state of a feature to be influenced by a variety of sources. For example, you could have a feature disabled by default, except it's enabled when a specific environment variable is set or when a web API returns a certain response or after a certain date has passed, or any combination of these in priority order.
import 'package:test/test.dart';

import 'package:feature_flag/feature_flag.dart';

void main() {
  test('Features with no decision sources should return their default value', () {
    final Feature<BinaryFeatureState> basicFeature = Feature<BinaryFeatureState>(
      name: 'Basic feature',
      defaultState: BinaryFeatureState.disabled,
      decisionSources: <DecisionFunction<BinaryFeatureState>>[],
    );

    expect(basicFeature.disabled, true);
  });

  test('A decision source\'s state should override the default state', () {
    final Feature<BinaryFeatureState> basicFeature = Feature<BinaryFeatureState>(
      name: 'Basic feature',
      defaultState: BinaryFeatureState.disabled,
      decisionSources: <DecisionFunction<BinaryFeatureState>>[
        () => StateResult<BinaryFeatureState>.state(BinaryFeatureState.enabled),
      ],
    );

    expect(basicFeature.enabled, true);
  });

  test('If all decision sources fall through, the default state should be returned', () {
    final Feature<BinaryFeatureState> basicFeature = Feature<BinaryFeatureState>(
      name: 'Basic feature',
      defaultState: BinaryFeatureState.disabled,
      decisionSources: <DecisionFunction<BinaryFeatureState>>[
        () => StateResult<BinaryFeatureState>.fallthrough(),
        () => StateResult<BinaryFeatureState>.fallthrough(),
      ],
    );

    expect(basicFeature.disabled, true);
  });

  test('The first decision source to return a state should be used', () {
    final Feature<BinaryFeatureState> basicFeature = Feature<BinaryFeatureState>(
      name: 'Basic feature',
      defaultState: BinaryFeatureState.disabled,
      decisionSources: <DecisionFunction<BinaryFeatureState>>[
        () => StateResult<BinaryFeatureState>.fallthrough(),
        () => StateResult<BinaryFeatureState>.state(BinaryFeatureState.enabled),
      ],
    );

    expect(basicFeature.enabled, true);
  });

  test('After a state is found, further decision sources should not be evaluated', () {
    bool evalOne = false;
    bool evalTwo = false;
    bool evalThree = false;

    final Feature<BinaryFeatureState> basicFeature = Feature<BinaryFeatureState>(
      name: 'Basic feature',
      defaultState: BinaryFeatureState.disabled,
      decisionSources: <DecisionFunction<BinaryFeatureState>>[
        () { evalOne = true; return StateResult<BinaryFeatureState>.fallthrough(); },
        () { evalTwo = true; return StateResult<BinaryFeatureState>.state(BinaryFeatureState.enabled); },
        () { evalThree = true; return StateResult<BinaryFeatureState>.fallthrough(); },
      ],
    );

    expect(basicFeature.enabled, true);
    expect(evalOne, true);
    expect(evalTwo, true);
    expect(evalThree, false);
  });
}
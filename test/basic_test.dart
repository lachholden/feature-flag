import 'package:test/test.dart';

import 'package:feature_flag/feature_flag.dart';

void main() {
  test('Features with no decision sources should return their default value', () {
    final Feature<BinaryFeatureState> basicFeature = Feature<BinaryFeatureState>(
      name: 'Basic feature',
      defaultState: BinaryFeatureState.disabled,
      decisionSources: [],
    );

    expect(basicFeature.disabled, true);
  });
}
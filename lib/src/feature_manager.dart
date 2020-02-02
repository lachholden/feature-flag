import '../feature_flag.dart';

/// Allows the creation and management en-masse of a set of features.
/// 
/// Your library/application will likely only need one instance of this, and all [Feature]s should
/// be created by one of the registration methods ([registerBinaryFeature], for example).
class FeatureManager {
  List<Feature<BinaryFeatureState>> _features = [];

  Feature<BinaryFeatureState> registerBinaryFeature(String name, {BinaryFeatureState defaultState, String description}) {
    var newFeature = Feature<BinaryFeatureState>(name: name, defaultState: defaultState);
    _features.add(newFeature);
    return newFeature;
  }
}
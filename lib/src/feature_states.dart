/// The state of a feature that is either enabled or disabled.
enum BinaryFeatureState { enabled, disabled }

/// Represents a union type of either a fallthrough result or a specific state of the type
/// `StateOption`.
class StateResult<StateOption> {
  StateResult._(this._isState, this._state);

  factory StateResult.fallthrough() {
    return StateResult<StateOption>._(false, null);
  }

  factory StateResult.state(StateOption state) {
    return StateResult<StateOption>._(true, state);
  }

  bool _isState;
  StateOption _state;

  bool get isState => _isState;
  StateOption get state {
    assert(_isState, 'You must check that the state result is not a fallthrough!');
    return _state;
  }
}

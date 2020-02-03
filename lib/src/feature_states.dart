/// The state of a feature that is either enabled or disabled.
enum BinaryFeatureState { enabled, disabled }

/// Represents a union type of either a fallthrough result or a specific state of the type
/// `StateOption`.
class StateResult<StateOption> {
  StateResult._(this._isState, this._state);

  /// Construct a fallthrough result.
  factory StateResult.fallthrough() {
    return StateResult<StateOption>._(false, null);
  }

  /// Construct a specific state result with the specific state as `state`.
  factory StateResult.state(StateOption state) {
    return StateResult<StateOption>._(true, state);
  }

  bool _isState;
  StateOption _state;

  /// Get whether this is a state result (that is, not a fallthrough result).
  bool get isState => _isState;

  /// Provided this is a state result, get the specific state.
  StateOption get state {
    assert(_isState, 'You must check that the state result is not a fallthrough!');
    return _state;
  }
}

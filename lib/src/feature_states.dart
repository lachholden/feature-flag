import 'package:sealed_unions/sealed_unions.dart';

/// The state of a feature that is either enabled or disabled.
enum BinaryFeatureState { enabled, disabled }


/// Represents a union type of either a fallthrough result or a specific state of the type
/// `StateOption`.
///
/// Written with the aid of https://resocoder.com/2019/09/16/sealed-unions-in-dart-never-write-an-if-statement-again-kind-of/
class StateResult<StateOption> extends Union2Impl<_Fallthrough, _State> {

  static final Doublet<_Fallthrough, _State> _factory = const Doublet<_Fallthrough, _State>();

  StateResult._(Union2<_Fallthrough, _State> union): super(union);

  factory StateResult.fallthrough() => 
    StateResult._(_factory.first(_Fallthrough()));

  factory StateResult.state(StateOption state) =>
    StateResult._(_factory.second(_State(state)));
}

class _Fallthrough {}

class _State<StateOption> {
  _State(this.state);
  final StateOption state;
}
import 'package:sealed_unions/sealed_unions.dart';

/// The state of a feature that is either enabled or disabled.
enum BinaryFeatureState { enabled, disabled }

class _Fallthrough {}

class _State {
  _State(this.state);
  final BinaryFeatureState state;
}


/// Represents a union type of either a fallthrough result or a specific binary state.
///
/// Written with the aid of https://resocoder.com/2019/09/16/sealed-unions-in-dart-never-write-an-if-statement-again-kind-of/
class BinaryFeatureStateResult extends Union2Impl<_Fallthrough, _State> {

  static final Doublet<_Fallthrough, _State> _factory = const Doublet<_Fallthrough, _State>();

  BinaryFeatureStateResult._(Union2<_Fallthrough, _State> union): super(union);

  factory BinaryFeatureStateResult.fallthrough() => 
    BinaryFeatureStateResult._(_factory.first(_Fallthrough()));

  factory BinaryFeatureStateResult.state(BinaryFeatureState state) =>
    BinaryFeatureStateResult._(_factory.second(_State(state)));
}

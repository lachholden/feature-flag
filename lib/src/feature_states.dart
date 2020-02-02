import 'package:sealed_unions/sealed_unions.dart';

/// The state of a feature that is either enabled or disabled.
enum BinaryFeatureState { enabled, disabled }


/// Represents a union type of either a fallthrough result or a specific state of the type
/// `StateOption`.
///
/// Written with the aid of https://resocoder.com/2019/09/16/sealed-unions-in-dart-never-write-an-if-statement-again-kind-of/
class StateResult<StateOption> extends Union2Impl<FallthroughResult, SpecificStateResult<StateOption>> {
  StateResult._(Union2<FallthroughResult, SpecificStateResult<StateOption>> union): super(union);

  factory StateResult.fallthrough() => 
    StateResult<StateOption>._(_factory.first(FallthroughResult()) as Union2<FallthroughResult,SpecificStateResult<StateOption>>);

  factory StateResult.state(StateOption state) =>
    StateResult<StateOption>._(_factory.second(SpecificStateResult<StateOption>(state)) as Union2<FallthroughResult,SpecificStateResult<StateOption>>);

  static const Doublet<FallthroughResult, SpecificStateResult<dynamic>> _factory = Doublet<FallthroughResult, SpecificStateResult<dynamic>>();
}

/// Represents a result that should fallthrough, that is defer decision making to another source.
class FallthroughResult {}

/// Represents a result that is a specific state of type `StateOption`. 
class SpecificStateResult<StateOption> {
  SpecificStateResult(this.state);
  final StateOption state;
}
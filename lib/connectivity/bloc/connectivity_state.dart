part of 'connectivity_bloc.dart';

@immutable
abstract class ConnectivityState extends Equatable{}

class ConnectivityInitialState extends ConnectivityState {
  @override
  List<Object> get props => <Object>[];
}

class ThereIsConnectivityState extends ConnectivityState {
  @override
  List<Object> get props => <Object>[];
}

class ThereIsNotConnectivityState extends ConnectivityState {
  @override
  List<Object> get props => <Object>[];
}

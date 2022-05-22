part of 'connectivity_bloc.dart';

@immutable
abstract class ConnectivityEvent extends Equatable{}

class StartListenConnectivityEvent extends ConnectivityEvent{
  @override
  List<Object> get props => <Object>[];

}

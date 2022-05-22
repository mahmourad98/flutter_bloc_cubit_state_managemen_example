import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_cubit_bloc_tutorial/connectivity/connectivity_service.dart';
import 'package:meta/meta.dart';

part 'connectivity_event.dart';
part 'connectivity_state.dart';

class ConnectivityBloc extends Bloc<ConnectivityEvent, ConnectivityState> {
  final ConnectivityService connectivityService;

  ConnectivityBloc(ConnectivityState initialState, this.connectivityService) : super(initialState) {
    on<StartListenConnectivityEvent>((event, emit) => _startListening());
  }


  void _startListening(){
    this.connectivityService.connectivityStreamController.stream.listen(
      (event) {
        if (event == ConnectivityResult.none){
          emit(ThereIsNotConnectivityState(),);
        }
        else{
          emit(ThereIsConnectivityState(),);
        }
      }
    );
  }
}

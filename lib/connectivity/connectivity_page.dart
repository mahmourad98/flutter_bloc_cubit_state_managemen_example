import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cubit_bloc_tutorial/connectivity/bloc/connectivity_bloc.dart';

class ConnectivityPage extends StatelessWidget {
  const ConnectivityPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ConnectivityBloc, ConnectivityState>(
      builder: (context, state,){
        return SafeArea(
          child: Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.zero,
              child: AppBar(),
            ),
            body: GestureDetector(
              onTap: (){
                BlocProvider.of<ConnectivityBloc>(context).add(StartListenConnectivityEvent(),);
              },
              child: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  color: _getColor(state),
                ),
              ),
            ),
          ),
        );
      }
    );
  }

  Color _getColor(ConnectivityState state) {
    if (state is ThereIsConnectivityState){
      return Colors.green;
    }
    else if(state is ThereIsNotConnectivityState){
      return Colors.red;
    }
    else{
      return Colors.yellow;
    }
  }
}

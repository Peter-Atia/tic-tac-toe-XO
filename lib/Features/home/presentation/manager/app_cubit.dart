import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xo/Features/home/presentation/manager/app_states.dart';

class AppCubit extends Cubit<AppStates>{
  AppCubit(): super(InitialState());
  String playerName = "X";

  void changePlayerTurn(){
    if (playerName == "X") {
      playerName = "O";
      emit(PlayerOTurn());
    }
    else {
      playerName = "X";
      emit(PlayerXTurn());
    }

  }




}
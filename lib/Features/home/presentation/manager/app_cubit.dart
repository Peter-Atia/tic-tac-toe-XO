import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xo/Features/home/presentation/manager/app_states.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(InitialState());
  String playerName = "X";
  String winner = "";
  bool gameOver = false;
  int cellsFilled = 0 ;
  late List<List<String>> board = [
    ["", "", ""],
    ["", "", ""],
    ["", "", ""],
  ];

  void changePlayerTurn() {
    if (playerName == "X") {
      playerName = "O";
      emit(PlayerOTurn());
    } else {
      playerName = "X";
      emit(PlayerXTurn());
    }
  }

  bool _isCellEmpty({required int row, required int col}) {
    if (board[row][col] == "") {
      return true;
    } else {
      return false;
    }
  }

  void fillCell({
    required int row,
    required int col,
    required String playerName,
  }) {
    if(gameOver){
      return;
    }
    if(_isCellEmpty(row: row, col: col)){
      board[row][col] = playerName;
      cellsFilled++;
      winner = checkWinner();
      changePlayerTurn();
    }


  }

  String checkWinner() {
    for (int i = 0; i < 3; i++) {
      if (board[i][0] != "" &&
          board[i][0] == board[i][1] &&
          board[i][1] == board[i][2]) {
        gameOver = true ;
        return board[i][0];
      }
    }

    //col
    for (int i = 0; i < 3; i++) {
      if (board[0][i] != "" &&
          board[0][i] == board[1][i] &&
          board[1][i] == board[2][i]) {
        gameOver = true ;
        return board[0][i];
      }
    }

    // left diagonal
    if (board[0][0] != "" &&
        board[0][0] == board[1][1] &&
        board[1][1] == board[2][2]) {
      gameOver = true ;
      return board[0][0];
    }
    //right diagonal
    if (board[0][2] != "" &&
        board[0][2] == board[1][1] &&
        board[1][1] == board[2][0]) {
      gameOver = true ;
      return board[0][2];
    }

    return "";
  }

  void restBoard() {
    playerName = "X";
    winner = "";
    gameOver = false;
    cellsFilled = 0 ;
    emit(InitialState());
    board = [
      ["", "", ""],
      ["", "", ""],
      ["", "", ""],
    ];
  }
}
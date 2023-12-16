import 'dart:io';

class TicTacToe {
  List<String> board = ['1','2','3','4','5','6','7','8','9']; // Representing the 3x3 board
  String currentPlayer = '1'; // Player '1' starts the game

  void displayBoard() {
    print(' ${board[0]} | ${board[1]} | ${board[2]} ');
    print('---+---+---');
    print(' ${board[3]} | ${board[4]} | ${board[5]} ');
    print('---+---+---');
    print(' ${board[6]} | ${board[7]} | ${board[8]} ');
  }

  bool isValidMove(int move) {
    return move >= 0 && move < 9 && board[move] != 'X' && board[move] != 'O';
  }

  bool checkWinner() {
    // Winning conditions - rows, columns, and diagonals
    return 
        (board[0] == board[1] && board[1] == board[2]) ||
        (board[3] == board[4] && board[4] == board[5]) ||
        (board[6] == board[7] && board[7] == board[8]) ||
        (board[0] == board[3] && board[3] == board[6]) ||
        (board[1] == board[4] && board[4] == board[7]) ||
        (board[2] == board[5] && board[5] == board[8]) ||
        (board[0] == board[4] && board[4] == board[8]) ||
        (board[2] == board[4] && board[4] == board[6]);
  }

  bool isDraw() {
    return 
      !board.contains('1') && 
      !board.contains('2') &&
      !board.contains('3') &&
      !board.contains('4') &&
      !board.contains('5') &&
      !board.contains('6') &&
      !board.contains('7') &&
      !board.contains('8') &&
      !board.contains('9');
  }

  void startGame() {
    print('Welcome to Tic-Tac-Toe!');
    String choice;
    do {
      displayBoard();
      int? move;
      do {
        currentPlayer == '1' ? choice = 'X' : choice = 'O';  
        print('Player $currentPlayer, please enter the number of the square where you want to place your $choice:');
        var input = stdin.readLineSync();
        move = int.tryParse(input ?? '');
        if (move == null || !isValidMove(move - 1)) {
          print('Invalid move. Please try again.');
        }
      } while (move == null || !isValidMove(move - 1));

      board[move - 1] = choice;

      if (checkWinner()) {
        displayBoard();
        print('Player $currentPlayer wins!');
        break;
      } else if (isDraw()) {
        displayBoard();
        print('It\'s a draw!');
        break;
      }

      currentPlayer = currentPlayer == '1' ? '2' : '1';
    } while (true);

    print('Do you want to play again? (yes/no)');
    var playAgain = stdin.readLineSync();
    if (playAgain?.toLowerCase() == 'yes') {
      board = ['1','2','3','4','5','6','7','8','9'];
      currentPlayer = '1';
      startGame();
    } else {
      print('Thanks for playing Tic-Tac-Toe!');
    }
  }
}

void main() {
  var game = TicTacToe();
  game.startGame();
}
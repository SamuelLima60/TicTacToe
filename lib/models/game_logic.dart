class GameLogic {
  static String? currentPlayer = "X";
  static List<String> occupied = ["", "", "", "", "", "", "", "", ""];

  void changeTurn(int index) {
    if (currentPlayer == "X") {
      currentPlayer = "O";
    } else {
      currentPlayer = "X";
    }
  }

  String? checkWinner() {
    List<List<int>> winningList = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [2, 4, 6],
    ];

    for (var winningListFor in winningList) {
      String firstPosition = occupied[winningListFor[0]];
      String secondPosition = occupied[winningListFor[1]];
      String thirdPosition = occupied[winningListFor[2]];

      if (firstPosition.isNotEmpty) {
        if (firstPosition == secondPosition && firstPosition == thirdPosition) {
          return firstPosition;
        }
      }
    }
    return null;
  }

  bool? checkDraw() {
    bool draw = true;
    for (var occupiedPlayer in occupied) {
      if (occupiedPlayer.isEmpty) {
        draw = false;
      }
    }

    if (draw) {
      return true;
    }
    return null;
  }
}

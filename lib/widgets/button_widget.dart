import 'package:flutter/material.dart';
import 'package:tictactoe/models/game_logic.dart';

class ButtonWidget extends StatefulWidget {
  final int index;

  const ButtonWidget({super.key, required this.index});

  @override
  State<ButtonWidget> createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget> {
  void snackBar(String win) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(win),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (GameLogic.occupied[widget.index].isNotEmpty) {
          return;
        }

        setState(() {
          GameLogic.occupied[widget.index] = GameLogic.currentPlayer!;
          GameLogic().changeTurn(widget.index);
          if (GameLogic().checkDraw() == true) {
            snackBar("Draw");
          }

          if (GameLogic().checkWinner() == null) {
            return;
          } else if (GameLogic().checkWinner() == "X") {
            snackBar("X Wins");
          } else {
            snackBar("O Wins");
          }
        });
      },
      child: Container(
        color: Colors.blue[900],
        child: Center(
          child: Text(
            GameLogic.occupied[widget.index],
            style: const TextStyle(
              fontSize: 40,
            ),
          ),
        ),
      ),
    );
  }
}

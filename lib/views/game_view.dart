import 'package:flutter/material.dart';
import 'package:tictactoe/models/game_logic.dart';

import '../widgets/button_widget.dart';

class GameView extends StatefulWidget {
  const GameView({super.key});

  @override
  State<GameView> createState() => _GameViewState();
}

class _GameViewState extends State<GameView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  'Tic Tac Toe',
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35),
            child: GridView.builder(
              shrinkWrap: true,
              itemCount: 9,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 5,
                crossAxisSpacing: 5,
                crossAxisCount: 3,
              ),
              itemBuilder: (ctx, index) {
                return ButtonWidget(
                  index: index,
                );
              },
            ),
          ),
          const SizedBox(height: 25),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue[900],
            ),
            onPressed: () {
              setState(() {});
              GameLogic.occupied = ["", "", "", "", "", "", "", "", ""];
            },
            child: const Text('Restart'),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/utils.dart';
import '../../../core/widgets/buttons/arrow_button.dart';
import '../../../core/widgets/buttons/primary_button.dart';
import '../../../core/widgets/custom_scaffold.dart';
import '../widgets/puzzle_piece.dart';
import '../widgets/win_dialog.dart';

class PuzzleGamePage extends StatefulWidget {
  const PuzzleGamePage({super.key, required this.id});

  final int id;

  @override
  State<PuzzleGamePage> createState() => _PuzzleGamePageState();
}

class _PuzzleGamePageState extends State<PuzzleGamePage> {
  List<int> pieces = [1, 2, 3, 4, 5, 6, 7, 8, 9];

  int? firstSelectedIndex;

  void check() {
    if (pieces[0] == 1 &&
        pieces[1] == 2 &&
        pieces[2] == 3 &&
        pieces[3] == 4 &&
        pieces[4] == 5 &&
        pieces[5] == 6 &&
        pieces[6] == 7 &&
        pieces[7] == 8 &&
        pieces[8] == 9) {
      showDialog(
        context: context,
        builder: (context) {
          return const WinDialog();
        },
      );
    }
  }

  void swapValues(int firstIndex, int secondIndex) {
    setState(() {
      try {
        int temp = pieces[firstIndex];
        pieces[firstIndex] = pieces[secondIndex];
        pieces[secondIndex] = temp;
        firstSelectedIndex = null;
      } catch (e) {
        print(e.toString());
      }
    });
    check();
  }

  bool started = false;

  void onShuffle() {
    setState(() {
      started = true;
      pieces.shuffle();
    });
  }

  void onPuzzle(int id) {
    if (firstSelectedIndex == null) {
      firstSelectedIndex = pieces.indexOf(id);
    } else {
      int secondSelectedIndex = pieces.indexOf(id);
      if (secondSelectedIndex == firstSelectedIndex) return;
      swapValues(firstSelectedIndex!, secondSelectedIndex);
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      bg: started ? widget.id : 3,
      started: started,
      body: Stack(
        children: [
          const ArrowButton(),
          Column(
            children: [
              SizedBox(height: 40 + getStatusBar(context)),
              Center(
                child: Text(
                  started ? '' : 'Puzzles',
                  style: const TextStyle(
                    color: AppColors.white,
                    fontSize: 32,
                    fontFamily: Fonts.bold,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                started ? '' : getPuzzleName(widget.id),
                style: const TextStyle(
                  color: AppColors.white,
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 64),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  PuzzlePiece(
                    id: widget.id,
                    puzzleID: pieces[0],
                    started: started,
                    onPressed: onPuzzle,
                  ),
                  const SizedBox(width: 8),
                  PuzzlePiece(
                    id: widget.id,
                    puzzleID: pieces[1],
                    started: started,
                    onPressed: onPuzzle,
                  ),
                  const SizedBox(width: 8),
                  PuzzlePiece(
                    id: widget.id,
                    puzzleID: pieces[2],
                    started: started,
                    onPressed: onPuzzle,
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  PuzzlePiece(
                    id: widget.id,
                    puzzleID: pieces[3],
                    started: started,
                    onPressed: onPuzzle,
                  ),
                  const SizedBox(width: 8),
                  PuzzlePiece(
                    id: widget.id,
                    puzzleID: pieces[4],
                    started: started,
                    onPressed: onPuzzle,
                  ),
                  const SizedBox(width: 8),
                  PuzzlePiece(
                    id: widget.id,
                    puzzleID: pieces[5],
                    started: started,
                    onPressed: onPuzzle,
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  PuzzlePiece(
                    id: widget.id,
                    puzzleID: pieces[6],
                    started: started,
                    onPressed: onPuzzle,
                  ),
                  const SizedBox(width: 8),
                  PuzzlePiece(
                    id: widget.id,
                    puzzleID: pieces[7],
                    started: started,
                    onPressed: onPuzzle,
                  ),
                  const SizedBox(width: 8),
                  PuzzlePiece(
                    id: widget.id,
                    puzzleID: pieces[8],
                    started: started,
                    onPressed: onPuzzle,
                  ),
                ],
              ),
              if (!started) ...[
                const SizedBox(height: 53),
                PrimaryButton(
                  title: 'Shuffle',
                  onPressed: onShuffle,
                ),
                const SizedBox(height: 21),
                const Text(
                  'When you press the\nShuffle button, the game\nwill start.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 16,
                  ),
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }
}

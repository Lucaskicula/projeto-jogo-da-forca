import 'dart:math';

import 'package:flutter/material.dart';
import 'package:jogodaforca/pages/history_page.dart';
import 'package:jogodaforca/widgets/hangman_widget.dart';
import 'package:jogodaforca/widgets/letter_button_widget.dart';

class ForcaPage extends StatefulWidget {
  const ForcaPage({super.key});

  @override
  State<ForcaPage> createState() => _ForcaPageState();
}

class _ForcaPageState extends State<ForcaPage> {
  final List<String> words = [
    'ALMOFADA',
    'CELULAR',
    'TECLADO',
    'TELEVISÃO',
    'COMPUTADOR',
    'CANETA',
    'CHINELO',
    'MOCHILA',
  ];

  final List<String> letters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZÃ'.split('');
  late String selectedWord;
  late List<String> triedLetters;
  late int remainingAttempts;
  final List<String> history = [];
  bool gameFinished = false;

  @override
  void initState() {
    super.initState();
    startNewGame();
  }

  void startNewGame() {
    setState(() {
      selectedWord = words[Random().nextInt(words.length)];
      triedLetters = [];
      remainingAttempts = 6;
      gameFinished = false;
    });
  }

  void tryLetter(String letter) {
    if (triedLetters.contains(letter) || gameFinished) {
      return;
    }

    setState(() {
      triedLetters.add(letter);

      if (!selectedWord.contains(letter)) {
        remainingAttempts--;
      }

      checkGameResult();
    });
  }

  void checkGameResult() {
    bool won = selectedWord
        .split('')
        .every((letter) => triedLetters.contains(letter));

    if (won) {
      gameFinished = true;
      history.add('Vitória - Palavra: $selectedWord');
    } else if (remainingAttempts == 0) {
      gameFinished = true;
      history.add('Derrota - Palavra: $selectedWord');
    }
  }

  String get displayedWord {
    return selectedWord
        .split('')
        .map((letter) => triedLetters.contains(letter) ? letter : '_')
        .join('  ');
  }

  String get gameMessage {
    if (!gameFinished) {
      return 'Escolha uma letra';
    }

    return playerWon
        ? 'Você venceu!'
        : 'Você perdeu! A palavra era $selectedWord';
  }

  bool get playerWon {
    return selectedWord
        .split('')
        .every((letter) => triedLetters.contains(letter));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Jogo da Forca',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => HistoryPage(history: history),
                ),
              );
            },
            icon: const Icon(Icons.history),
            tooltip: 'Histórico',
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 8,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Text(
                      'Tentativas restantes: $remainingAttempts',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        HangmanWidget(errors: 6 - remainingAttempts),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            children: [
                              FittedBox(
                                child: Text(
                                  displayedWord,
                                  style: const TextStyle(
                                    fontSize: 32,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 2,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 18),
                              Text(
                                gameMessage,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: !gameFinished
                                      ? Colors.black54
                                      : playerWon
                                      ? Colors.green
                                      : Colors.red,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Wrap(
                spacing: 7,
                runSpacing: 7,
                alignment: WrapAlignment.center,
                children: letters.map((letter) {
                  return LetterButtonWidget(
                    text: letter,
                    wasUsed: triedLetters.contains(letter) || gameFinished,
                    onPressed: () {
                      tryLetter(letter);
                    },
                  );
                }).toList(),
              ),
              const SizedBox(height: 22),
              SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton.icon(
                  onPressed: startNewGame,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.yellow,
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  icon: const Icon(Icons.refresh),
                  label: const Text(
                    'Nova partida',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

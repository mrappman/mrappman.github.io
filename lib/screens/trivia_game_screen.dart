import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maveli_mart/blocs/trivia_game_bloc/bloc/trivia_game_bloc.dart';
import 'package:maveli_mart/data/models/trivia_game_response.dart';
import 'package:maveli_mart/utils/colors.dart';

class TriviaGameScreen extends StatefulWidget {
  const TriviaGameScreen({super.key});

  @override
  State<TriviaGameScreen> createState() => _TriviaGameScreenState();
}

class _TriviaGameScreenState extends State<TriviaGameScreen> {
  final TriviaGameBloc triviaGameBloc = TriviaGameBloc();

  List<Trivia> triviaList = [];

  int currentQuestionIndex = 0;
  int score = 0;

  String? selectedAnswer;
  bool answerSubmitted = false;
  bool showHint = false;

  @override
  void initState() {
    super.initState();

    triviaGameBloc.add(GetTriviaGameEvent());
  }

  @override
  void dispose() {
    triviaGameBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: neutral,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Onam Trivia',
          style: TextStyle(
            color: primaryColor,
            fontWeight: FontWeight.w600,
            fontSize: 24,
            fontFamily: "NotoSerif",
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: primaryColor),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 700),
          child: BlocBuilder<TriviaGameBloc, TriviaGameState>(
            bloc: triviaGameBloc,
            builder: (context, state) {
              if (state is TriviaGameLoadingState && triviaList.isEmpty) {
                return const Center(
                  child: CircularProgressIndicator(color: primaryColor),
                );
              }

              if (state is TriviaGameSuccessState) {
                triviaList = state.successResponse.trivia ?? [];
              }

              if (state is TriviaGameErrorState && triviaList.isEmpty) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.error_outline,
                        color: Colors.red,
                        size: 48,
                      ),

                      const SizedBox(height: 12),

                      Text(
                        state.errorMsg,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 14,
                          color: labelColor,
                          fontFamily: "Vietnam",
                        ),
                      ),

                      const SizedBox(height: 16),

                      ElevatedButton.icon(
                        onPressed: () {
                          triviaGameBloc.add(GetTriviaGameEvent());
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: primaryColor,
                          foregroundColor: Colors.white,
                        ),
                        icon: const Icon(Icons.refresh),
                        label: const Text(
                          'Retry',
                          style: TextStyle(fontFamily: "Vietnam"),
                        ),
                      ),
                    ],
                  ),
                );
              }

              if (triviaList.isEmpty) {
                return const Center(
                  child: Text(
                    'No trivia questions available.',
                    style: TextStyle(fontFamily: "Vietnam"),
                  ),
                );
              }

              return _buildTriviaContent();
            },
          ),
        ),
      ),
    );
  }

  Widget _buildTriviaContent() {
    final Trivia currentQuestion = triviaList[currentQuestionIndex];

    final List<String> options = currentQuestion.options ?? [];

    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(24, 24, 24, 120),
      child: Column(
        children: [
          _buildProgressCard(),

          const SizedBox(height: 36),

          _buildQuestionCard(currentQuestion, options),
        ],
      ),
    );
  }

  Widget _buildProgressCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 22),
      decoration: BoxDecoration(
        color: neutral,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFE4DDCC)),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'PROGRESS',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1.2,
                    color: labelColor,
                    fontFamily: 'Vietnam',
                  ),
                ),

                const SizedBox(height: 6),

                Text(
                  'Question ${currentQuestionIndex + 1}/${triviaList.length}',
                  style: const TextStyle(
                    fontFamily: 'Vietnam',
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: primaryColor,
                  ),
                ),
              ],
            ),
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Text(
                'SCORE',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.2,
                  color: labelColor,
                  fontFamily: 'Vietnam',
                ),
              ),

              const SizedBox(height: 6),

              Text(
                '$score',
                style: const TextStyle(
                  fontFamily: 'Vietnam',
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: primaryColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildQuestionCard(Trivia question, List<String> options) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(28, 32, 28, 30),
      // decoration: BoxDecoration(
      //   //color: Colors.white,
      //  // borderRadius: BorderRadius.circular(20),
      //   // boxShadow: const [
      //   //   BoxShadow(
      //   //     blurRadius: 12,
      //   //     offset: Offset(0, 5),
      //   //     color: Color(0x14000000),
      //   //   ),
      //   // ],
      // ),
      child: Column(
        children: [
          Text(
            question.question ?? '',
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontFamily: 'Vietnam',
              fontSize: 20,
              fontWeight: FontWeight.bold,
              height: 1.15,
              color: Colors.black,
            ),
          ),

          const SizedBox(height: 28),

          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(width: 65, child: Divider(color: Color(0xFFE0C96D))),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 14),
                child: Icon(
                  Icons.local_florist,
                  color: Color(0xFFE0C96D),
                  size: 20,
                ),
              ),
              SizedBox(width: 65, child: Divider(color: Color(0xFFE0C96D))),
            ],
          ),

          const SizedBox(height: 30),

          GestureDetector(
            onTap: () {
              setState(() {
                showHint = !showHint;
              });
            },
            child: Text(
              showHint ? question.hint ?? "No hint available" : '[Show Hint]',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                fontFamily: "Vietnam",
                color: primaryColor,
              ),
            ),
          ),

          const SizedBox(height: 30),

          ...List.generate(options.length, (index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 14),
              child: _buildAnswerOption(index, options[index], question),
            );
          }),

          const SizedBox(height: 15),

          _buildActionButton(question),
        ],
      ),
    );
  }

  Widget _buildAnswerOption(int index, String answer, Trivia question) {
    final letters = ['A', 'B', 'C', 'D'];

    final bool isSelected = selectedAnswer == answer;

    final bool isCorrect = answerSubmitted && answer == question.correctAnswer;

    final bool isWrong =
        answerSubmitted && isSelected && answer != question.correctAnswer;

    Color backgroundColor = const Color(0xFFF9F1E2);

    Color borderColor = const Color(0xFFE8E1D1);

    if (isSelected) {
      backgroundColor = const Color(0xFFE8F5E9);
      borderColor = primaryColor;
    }

    if (isCorrect) {
      backgroundColor = const Color(0xFFE4F4E6);
      borderColor = primaryColor;
    }

    if (isWrong) {
      backgroundColor = const Color(0xFFFFE8E6);
      borderColor = Colors.red;
    }

    return InkWell(
      onTap: answerSubmitted
          ? null
          : () {
              setState(() {
                selectedAnswer = answer;
              });
            },
      borderRadius: BorderRadius.circular(16),
      child: Container(
        height: 76,
        padding: const EdgeInsets.symmetric(horizontal: 18),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: borderColor, width: 2),
        ),
        child: Row(
          children: [
            Container(
              width: 44,
              height: 44,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: Center(
                child: Text(
                  letters[index],
                  style: const TextStyle(fontSize: 20, color: primaryColor),
                ),
              ),
            ),

            const SizedBox(width: 20),

            Expanded(
              child: Text(
                answer,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF28251F),
                  fontFamily: "Vietnam",
                ),
              ),
            ),

            if (isCorrect) const Icon(Icons.check_circle, color: primaryColor),

            if (isWrong) const Icon(Icons.cancel, color: Colors.red),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButton(Trivia question) {
    if (!answerSubmitted) {
      return SizedBox(
        width: double.infinity,
        height: 54,
        child: ElevatedButton(
          onPressed: selectedAnswer == null
              ? null
              : () {
                  final bool correct = selectedAnswer == question.correctAnswer;

                  setState(() {
                    answerSubmitted = true;

                    if (correct) {
                      score += question.points ?? 0;
                    }
                  });
                },
          style: ElevatedButton.styleFrom(
            backgroundColor: primaryColor,
            foregroundColor: Colors.white,
            disabledBackgroundColor: Colors.grey.shade300,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
          ),
          child: const Text(
            'SUBMIT ANSWER',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              letterSpacing: .8,
              fontFamily: "Vietnam",
            ),
          ),
        ),
      );
    }

    final bool correct = selectedAnswer == question.correctAnswer;

    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: correct ? const Color(0xFFE8F5E9) : const Color(0xFFFFEBEE),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            correct
                ? '🎉 Correct!'
                : '❌ Not quite! Correct answer: ${question.correctAnswer}',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: correct ? primaryColor : Colors.red,
            ),
          ),
        ),

        const SizedBox(height: 18),

        SizedBox(
          width: double.infinity,
          height: 54,
          child: ElevatedButton(
            onPressed: _nextQuestion,
            style: ElevatedButton.styleFrom(
              backgroundColor: primaryColor,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
            ),
            child: Text(
              currentQuestionIndex == triviaList.length - 1
                  ? 'FINISH GAME'
                  : 'NEXT QUESTION',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: "Vietnam",
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _nextQuestion() {
    if (currentQuestionIndex < triviaList.length - 1) {
      setState(() {
        currentQuestionIndex++;
        selectedAnswer = null;
        answerSubmitted = false;
        showHint = false;
      });
    } else {
      _showFinalScore();
    }
  }

  void _showFinalScore() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: const Text(
            'Onam Trivia Complete!',
            style: TextStyle(
              fontFamily: 'Vietnam',
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Text(
            'Your score: $score points',
            style: const TextStyle(fontSize: 20, fontFamily: 'Vietnam'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                setState(() {
                  currentQuestionIndex = 0;
                  score = 0;
                  selectedAnswer = null;
                  answerSubmitted = false;
                  showHint = false;
                });
              },
              child: const Text('PLAY AGAIN'),
            ),

            TextButton(
              onPressed: () {
                Navigator.popUntil(context, (route) => route.isFirst);
              },
              child: const Text('BACK TO HOME'),
            ),
          ],
        );
      },
    );
  }
}

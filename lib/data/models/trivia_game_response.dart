// To parse this JSON data, do
//
//     final triviaGameResponseModel = triviaGameResponseModelFromJson(jsonString);

import 'dart:convert';

TriviaGameResponseModel triviaGameResponseModelFromJson(String str) => TriviaGameResponseModel.fromJson(json.decode(str));

String triviaGameResponseModelToJson(TriviaGameResponseModel data) => json.encode(data.toJson());

class TriviaGameResponseModel {
    final List<Trivia>? trivia;

    TriviaGameResponseModel({
        this.trivia,
    });

    factory TriviaGameResponseModel.fromJson(Map<String, dynamic> json) => TriviaGameResponseModel(
        trivia: json["trivia"] == null ? [] : List<Trivia>.from(json["trivia"]!.map((x) => Trivia.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "trivia": trivia == null ? [] : List<dynamic>.from(trivia!.map((x) => x.toJson())),
    };
}

class Trivia {
    final String? category;
    final String? question;
    final List<String>? options;
    final String? correctAnswer;
    final int? points;
    final String? hint;

    Trivia({
        this.category,
        this.question,
        this.options,
        this.correctAnswer,
        this.points,
        this.hint,
    });

    factory Trivia.fromJson(Map<String, dynamic> json) => Trivia(
        category: json["category"],
        question: json["question"],
        options: json["options"] == null ? [] : List<String>.from(json["options"]!.map((x) => x)),
        correctAnswer: json["correct_answer"],
        points: json["points"],
        hint: json["hint"],
    );

    Map<String, dynamic> toJson() => {
        "category": category,
        "question": question,
        "options": options == null ? [] : List<dynamic>.from(options!.map((x) => x)),
        "correct_answer": correctAnswer,
        "points": points,
        "hint": hint,
    };
}

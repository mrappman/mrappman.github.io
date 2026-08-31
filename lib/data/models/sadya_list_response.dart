// To parse this JSON data, do
//
//     final sadyaListResponseModel = sadyaListResponseModelFromJson(jsonString);

import 'dart:convert';

List<SadyaListResponseModel> sadyaListResponseModelFromJson(String str) => List<SadyaListResponseModel>.from(json.decode(str).map((x) => SadyaListResponseModel.fromJson(x)));

String sadyaListResponseModelToJson(List<SadyaListResponseModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SadyaListResponseModel {
    final String? id;
    final String? name;
    final String? description;
    final List<String>? tags;
    final int? cost;
    final int? calories;
    final String? spiciness;
    final int? servingOrder;
    final Flavors? flavors;
    final int? prepTimeMin;
    final List<String>? allergens;
    final DebateComments? debateComments;

    SadyaListResponseModel({
        this.id,
        this.name,
        this.description,
        this.tags,
        this.cost,
        this.calories,
        this.spiciness,
        this.servingOrder,
        this.flavors,
        this.prepTimeMin,
        this.allergens,
        this.debateComments,
    });

    factory SadyaListResponseModel.fromJson(Map<String, dynamic> json) => SadyaListResponseModel(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        tags: json["tags"] == null ? [] : List<String>.from(json["tags"]!.map((x) => x)),
        cost: json["cost"],
        calories: json["calories"],
        spiciness: json["spiciness"],
        servingOrder: json["serving_order"],
        flavors: json["flavors"] == null ? null : Flavors.fromJson(json["flavors"]),
        prepTimeMin: json["prep_time_min"],
        allergens: json["allergens"] == null ? [] : List<String>.from(json["allergens"]!.map((x) => x)),
        debateComments: json["debate_comments"] == null ? null : DebateComments.fromJson(json["debate_comments"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "tags": tags == null ? [] : List<dynamic>.from(tags!.map((x) => x)),
        "cost": cost,
        "calories": calories,
        "spiciness": spiciness,
        "serving_order": servingOrder,
        "flavors": flavors?.toJson(),
        "prep_time_min": prepTimeMin,
        "allergens": allergens == null ? [] : List<dynamic>.from(allergens!.map((x) => x)),
        "debate_comments": debateComments?.toJson(),
    };
}

class DebateComments {
    final String? grandma;
    final String? kid;
    final String? healthFreak;

    DebateComments({
        this.grandma,
        this.kid,
        this.healthFreak,
    });

    factory DebateComments.fromJson(Map<String, dynamic> json) => DebateComments(
        grandma: json["grandma"],
        kid: json["kid"],
        healthFreak: json["health_freak"],
    );

    Map<String, dynamic> toJson() => {
        "grandma": grandma,
        "kid": kid,
        "health_freak": healthFreak,
    };
}

class Flavors {
    final int? sweet;
    final int? spicy;
    final int? sour;
    final int? salty;

    Flavors({
        this.sweet,
        this.spicy,
        this.sour,
        this.salty,
    });

    factory Flavors.fromJson(Map<String, dynamic> json) => Flavors(
        sweet: json["sweet"],
        spicy: json["spicy"],
        sour: json["sour"],
        salty: json["salty"],
    );

    Map<String, dynamic> toJson() => {
        "sweet": sweet,
        "spicy": spicy,
        "sour": sour,
        "salty": salty,
    };
}

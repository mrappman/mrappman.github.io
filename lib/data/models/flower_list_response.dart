// To parse this JSON data, do
//
//     final flowerListResponseModel = flowerListResponseModelFromJson(jsonString);

import 'dart:convert';

FlowerListResponseModel flowerListResponseModelFromJson(String str) => FlowerListResponseModel.fromJson(json.decode(str));

String flowerListResponseModelToJson(FlowerListResponseModel data) => json.encode(data.toJson());

class FlowerListResponseModel {
    final List<Flower>? flowers;
    final List<Template>? templates;

    FlowerListResponseModel({
        this.flowers,
        this.templates,
    });

    factory FlowerListResponseModel.fromJson(Map<String, dynamic> json) => FlowerListResponseModel(
        flowers: json["flowers"] == null ? [] : List<Flower>.from(json["flowers"]!.map((x) => Flower.fromJson(x))),
        templates: json["templates"] == null ? [] : List<Template>.from(json["templates"]!.map((x) => Template.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "flowers": flowers == null ? [] : List<dynamic>.from(flowers!.map((x) => x.toJson())),
        "templates": templates == null ? [] : List<dynamic>.from(templates!.map((x) => x.toJson())),
    };
}

class Flower {
    final String? name;
    final String? scientificName;
    final List<String>? colors;
    final int? costPerKg;
    final String? difficulty;
    final String? petalDensity;
    final int? freshnessHours;
    final int? recommendedLayer;
    final int? layerSymmetry;
    final String? significance;

    Flower({
        this.name,
        this.scientificName,
        this.colors,
        this.costPerKg,
        this.difficulty,
        this.petalDensity,
        this.freshnessHours,
        this.recommendedLayer,
        this.layerSymmetry,
        this.significance,
    });

    factory Flower.fromJson(Map<String, dynamic> json) => Flower(
        name: json["name"],
        scientificName: json["scientific_name"],
        colors: json["colors"] == null ? [] : List<String>.from(json["colors"]!.map((x) => x)),
        costPerKg: json["cost_per_kg"],
        difficulty: json["difficulty"],
        petalDensity: json["petal_density"],
        freshnessHours: json["freshness_hours"],
        recommendedLayer: json["recommended_layer"],
        layerSymmetry: json["layer_symmetry"],
        significance: json["significance"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "scientific_name": scientificName,
        "colors": colors == null ? [] : List<dynamic>.from(colors!.map((x) => x)),
        "cost_per_kg": costPerKg,
        "difficulty": difficulty,
        "petal_density": petalDensity,
        "freshness_hours": freshnessHours,
        "recommended_layer": recommendedLayer,
        "layer_symmetry": layerSymmetry,
        "significance": significance,
    };
}

class Template {
    final String? name;
    final int? layerCount;
    final int? recommendedDiameterCm;
    final String? difficulty;
    final String? geometry;

    Template({
        this.name,
        this.layerCount,
        this.recommendedDiameterCm,
        this.difficulty,
        this.geometry,
    });

    factory Template.fromJson(Map<String, dynamic> json) => Template(
        name: json["name"],
        layerCount: json["layer_count"],
        recommendedDiameterCm: json["recommended_diameter_cm"],
        difficulty: json["difficulty"],
        geometry: json["geometry"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "layer_count": layerCount,
        "recommended_diameter_cm": recommendedDiameterCm,
        "difficulty": difficulty,
        "geometry": geometry,
    };
}

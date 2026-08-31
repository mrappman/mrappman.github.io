// To parse this JSON data, do
//
//     final maveliTrackerModel = maveliTrackerModelFromJson(jsonString);

import 'dart:convert';

MaveliTrackerModel maveliTrackerModelFromJson(String str) => MaveliTrackerModel.fromJson(json.decode(str));

String maveliTrackerModelToJson(MaveliTrackerModel data) => json.encode(data.toJson());

class MaveliTrackerModel {
    final String? status;
    final Location? location;
    final String? quote;
    final DateTime? lastSeen;
    final int? energyLevel;
    final bool? umbrellaIntact;
    final int? countdownSeconds;
    final int? speedKmh;
    final double? moodFactor;
    final int? checkpointProgressPct;
    final List<Location>? checkpoints;
    final List<String>? giftsBag;

    MaveliTrackerModel({
        this.status,
        this.location,
        this.quote,
        this.lastSeen,
        this.energyLevel,
        this.umbrellaIntact,
        this.countdownSeconds,
        this.speedKmh,
        this.moodFactor,
        this.checkpointProgressPct,
        this.checkpoints,
        this.giftsBag,
    });

    factory MaveliTrackerModel.fromJson(Map<String, dynamic> json) => MaveliTrackerModel(
        status: json["status"],
        location: json["location"] == null ? null : Location.fromJson(json["location"]),
        quote: json["quote"],
        lastSeen: json["last_seen"] == null ? null : DateTime.parse(json["last_seen"]),
        energyLevel: json["energy_level"],
        umbrellaIntact: json["umbrella_intact"],
        countdownSeconds: json["countdown_seconds"],
        speedKmh: json["speed_kmh"],
        moodFactor: json["mood_factor"]?.toDouble(),
        checkpointProgressPct: json["checkpoint_progress_pct"],
        checkpoints: json["checkpoints"] == null ? [] : List<Location>.from(json["checkpoints"]!.map((x) => Location.fromJson(x))),
        giftsBag: json["gifts_bag"] == null ? [] : List<String>.from(json["gifts_bag"]!.map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "location": location?.toJson(),
        "quote": quote,
        "last_seen": lastSeen?.toIso8601String(),
        "energy_level": energyLevel,
        "umbrella_intact": umbrellaIntact,
        "countdown_seconds": countdownSeconds,
        "speed_kmh": speedKmh,
        "mood_factor": moodFactor,
        "checkpoint_progress_pct": checkpointProgressPct,
        "checkpoints": checkpoints == null ? [] : List<dynamic>.from(checkpoints!.map((x) => x.toJson())),
        "gifts_bag": giftsBag == null ? [] : List<dynamic>.from(giftsBag!.map((x) => x)),
    };
}

class Location {
    final String? name;
    final double? latitude;
    final double? longitude;
    final bool? visited;

    Location({
        this.name,
        this.latitude,
        this.longitude,
        this.visited,
    });

    factory Location.fromJson(Map<String, dynamic> json) => Location(
        name: json["name"],
        latitude: json["latitude"]?.toDouble(),
        longitude: json["longitude"]?.toDouble(),
        visited: json["visited"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "latitude": latitude,
        "longitude": longitude,
        "visited": visited,
    };
}

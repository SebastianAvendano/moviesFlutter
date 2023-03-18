import 'dart:convert';

class Dates {
    Dates({
        this.maximum,
        this.minimum,
    });

    final DateTime? maximum;
    final DateTime? minimum;

    Dates copyWith({
        DateTime? maximum,
        DateTime? minimum,
    }) => 
        Dates(
            maximum: maximum ?? this.maximum,
            minimum: minimum ?? this.minimum,
        );

    factory Dates.fromRawJson(String str) => Dates.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Dates.fromJson(Map<String, dynamic> json) => Dates(
        maximum: json["maximum"] == null ? null : DateTime.parse(json["maximum"]),
        minimum: json["minimum"] == null ? null : DateTime.parse(json["minimum"]),
    );

    Map<String, dynamic> toJson() => {
        "maximum": "${maximum!.year.toString().padLeft(4, '0')}-${maximum!.month.toString().padLeft(2, '0')}-${maximum!.day.toString().padLeft(2, '0')}",
        "minimum": "${minimum!.year.toString().padLeft(4, '0')}-${minimum!.month.toString().padLeft(2, '0')}-${minimum!.day.toString().padLeft(2, '0')}",
    };
}
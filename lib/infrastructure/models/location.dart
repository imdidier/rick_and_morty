class LocationModel {
  final String greeting;
  final List<String> instructions;

  LocationModel({
    required this.greeting,
    required this.instructions,
  });

  factory LocationModel.fromJson(Map<String, dynamic> json) => LocationModel(
        greeting: json["greeting"],
        instructions: List<String>.from(json["instructions"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "greeting": greeting,
        "instructions": List<dynamic>.from(instructions.map((x) => x)),
      };
}

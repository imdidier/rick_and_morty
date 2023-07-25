class Location {
  final String greeting;
  final List<String> instructions;

  Location({
    required this.greeting,
    required this.instructions,
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        greeting: json["greeting"],
        instructions: List<String>.from(json["instructions"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "greeting": greeting,
        "instructions": List<dynamic>.from(instructions.map((x) => x)),
      };
}

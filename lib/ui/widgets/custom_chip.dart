import 'package:flutter/material.dart';

class CustomChip extends StatelessWidget {
  final String label;
  const CustomChip({Key? key, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Chip(label: Text(label));
  }
}

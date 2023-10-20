import 'package:flutter/material.dart';

abstract class SimpleComponent {
  final String name;

  Map<String, dynamic> get value;
  Widget component();
  Future <void> validate();

  SimpleComponent({
    required this.name
  });
}

class SimpleTextForm implements SimpleComponent{
  @override
  final String name;
  final String label;
  final String? hint;
  final TextEditingController controller;
  final bool isRequired = true;

  SimpleTextForm({
    required this.name,
    required this.label,
    String? defaultText,
    this.hint
  }) : controller = TextEditingController(text: defaultText);

  @override
  Widget component() {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: label,
        hintText: hint,
      ),
    );
  }

  @override
  Future<void> validate() async {
  }

  @override
  Map<String, dynamic> get value => <String, dynamic>{name: controller.text};
}

class SimpleLabel implements SimpleComponent{
  @override
  final String name;

  SimpleLabel({required this.name});

  @override
  Widget component() {
    return Text(name);
  }

  @override
  Future<void> validate() async {
  }

  @override
  // TODO: implement value
  Map<String, dynamic> get value => {};

}
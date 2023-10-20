import 'package:flutter/material.dart';

import 'step_component.dart';
import 'type.dart';

class SimpleStep {
  final Widget? title;
  final List<SimpleComponent> inputs;
  final StepEvent onValidate = _defaultOnNext;

  SimpleStep ({
    this.title,
    required this.inputs,
  });

  static Future<void> _defaultOnNext(StepValue value) async {}

  Map<String, dynamic> get value {
    return inputs.fold(<String, dynamic>{}, (prev, input) {
      return prev..addAll(input.value);
    });
  }

  Future<void> _validateFields() async {
    for (var input in inputs) {
      await input.validate();
    }
  }

  Future<void> validate(StepValue value) async {
    _validateFields();
    await onValidate(value);
  }

  Widget widget() {
    return Column(
      children: [
        if (title != null) title!,
        for (var input in inputs) ...[input.component(), _space ],
      ],
    );
  }

  static const _space = SizedBox(height: 8);
}
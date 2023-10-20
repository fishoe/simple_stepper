import 'package:flutter/material.dart';

import 'style.dart';
import 'type.dart';
import 'step.dart';

class SimpleStepper extends StatefulWidget {
  final List<SimpleStep> steps;
  final StepEvent onSubmit;
  final ErrorHandler errorHandler;
  const SimpleStepper({
    required this.steps,
    this.onSubmit = _defaultSubmit,
    this.errorHandler = _defaultErrorHandler,
    super.key
  });

  static Future<void> _defaultSubmit(StepValue value) async {}

  static Future<void> _defaultErrorHandler(Exception e) async {
    debugPrint(e.toString());
  }

  @override
  State<SimpleStepper> createState() => _SimpleStepperState();
}

class _SimpleStepperState extends State<SimpleStepper> {
  var _currentStepIndex = 0;
  final StepValue _entireStepValues = {};

  Widget _stepIndicator(int index) {
    var bgColor = (index == _currentStepIndex) ? Colors.brown : Colors.black12;
    return CircleAvatar(
      radius: 15,
      backgroundColor: bgColor,
      child: Text(
        (index + 1).toString(),
        style: AppTextStyles.button,
      ),
    );
  }

  Widget _stepIndicators() {
    var indicators = List<Widget>.generate(
        widget.steps.length, (index) => _stepIndicator(index));
    var len = indicators.length * 2 - 1;
    indicators = [
      for (int i = 0; i < len; i++)
        if (i % 2 == 0)
          indicators[i ~/ 2]
        else
          Container(width: 20, height: 1, color: Colors.black12)
    ];
    return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: indicators
    );
  }

  Widget _stepButton() {
    final currentStep = _currentStepIndex + 1;
    final stepLength = widget.steps.length;
    return (currentStep < stepLength) ?  _nextButton() : _submitButton();
  }

  StepValue getStepValuesUntil(int index) {
    final stepValues = <String, dynamic>{};
    for (int i = 0; i < index; i++) {
      final step = widget.steps[i];
      final stepValue = step.value;
      stepValues.addAll(stepValue);
    }
    return stepValues;
  }

  StepValue getAllStepValues() {
    return getStepValuesUntil(widget.steps.length);
  }

  Future<bool> _validateStepAndSave() async {
    try {
      final currentStep = widget.steps[_currentStepIndex];
      final stepValue = getStepValuesUntil(_currentStepIndex + 1);
      await currentStep.validate(stepValue);
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
    return true;
  }

  ElevatedButton _nextButton() {
    return ElevatedButton(
      onPressed: _nextStepEvent,
      child: const Text("다음"),
    );
  }

  void _nextStepEvent() async {
    var isValid = await _validateStepAndSave();
    if (!isValid) return;
    setState(() {
      _currentStepIndex++;
    });
  }

  ElevatedButton _submitButton() {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
            AppColors.greenButton
        ),
      ),
      onPressed: _submitStepEvent,
      child: const Text("완료"),
    );
  }

  void _submitStepEvent() async {
    var isValid = await _validateStepAndSave();
    if (!isValid) return;
    final stepValues = getAllStepValues();
    widget.onSubmit(stepValues);
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      _stepIndicators(),
      widget.steps[_currentStepIndex].widget(),
      SizedBox(
        width: double.maxFinite,
        height: 50,
        child: _stepButton(),
      ),
    ]);
  }
}
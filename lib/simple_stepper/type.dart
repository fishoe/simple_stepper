typedef StepValue = Map<String, dynamic>;
typedef StepEvent = Future<void> Function(StepValue);
typedef ErrorHandler = void Function(Exception);
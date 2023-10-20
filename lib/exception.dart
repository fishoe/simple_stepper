class InvalidFormValue implements Exception {
  final String formName;
  final String field;
  final Object value;
  final String message;
  final bool backAction;

  InvalidFormValue({
    required this.formName,
    required this.field,
    required this.value,
    required this.message,
    this.backAction = false,
  });

  @override
  String toString() {
    return "in form($formName), $field has value : $value, \n $message";
  }
}

class EmptyFormValue implements Exception {
  final String formName;
  final String field;
  final String message;

  EmptyFormValue({
    required this.formName,
    required this.field,
    required this.message,
  });

  @override
  String toString() {
    return "in form($formName), $field is empty";
  }
}

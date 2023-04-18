enum ValidationError {
  requiredField,
  invalidField
}

extension ValidationErrorExtension on ValidationError {
  String get description {
    switch(this) {
      case ValidationError.requiredField: return 'Required field';
      case ValidationError.invalidField: return 'Invalid field';
      default: return 'Error';
    }
  }
}

extension IntExtension on int {
  int squared() => this * this;
}

main() {
  var error = ValidationError.requiredField;
  print(error.description);
  print('The square of ${4} is ${4.squared()}');
}
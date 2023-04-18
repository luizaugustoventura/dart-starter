As we already know, everything in Dart extends from **class**. But a really nice Dart feature is possibility of creating extensions classes, adding new features to them. For example, say you have an `enum` for validation errors and you want to display a message whenever one of these errors happened, so you don't have to transform the enum into a string whenever this happens:

```Dart
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

main() {
  var error = ValidationError.requiredField;
  print(error.description);
}
```

Continuing, it is also possible to create **extensions** for **built-in classes**. For example, say you need a helper to return the square of every integer:

```Dart
extension IntExtension on int {
  int squared() => this * this;
}

main() {
  print('The square of ${4} is ${4.squared()}');
}
```
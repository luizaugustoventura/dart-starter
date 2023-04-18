To import packages in Dart, you use the `import package:page_name_or_path` syntax.

When working with complex files, you might need to import lots of packages. In these cases, you might also have conflicting packages containing properties or methods with the same name. To solve that, you can name the import as the following code:

```Dart
import 'package:meta/meta.dart' as meta;

int sum({meta.required int n1, meta.required int n2}) => n1 + n2;

main() {
  var x = sum(n1: 1, n2: 2);
  print(x);
}
```

If other imports also had properties with the name `required`, by doing this you would get rid of errors.

Also, in case you only want to use one property or method from a package, you can import specific methods or props like this:

```Dart
import 'package:meta/meta.dart' show required;

int sum({required int n1, required int n2}) => n1 + n2;

main() {
  var x = sum(n1: 1, n2: 2);
  print(x);
}
```

Some people might think that by doing this they would increase the performance of their application, but this is not truth. This will only help you organize your code, solve conflicting imports, and get your intellisense cleaner.
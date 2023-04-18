Asynchronous functions are widely used in Dart. To create an asynchronous functions you must provide a type using `Future` (similar to JavaScript's `Promise`) and tag the function with `async`. For example:

```Dart
import 'dart:convert';

class UserModel {
  final String firstName;
  final String lastName;
  final String fullName;

  const UserModel(this.firstName, this.lastName) : fullName = '$firstName $lastName';

  UserModel.fromJson(Map json) : this(json['firstName'], json['lastName']);

  factory UserModel.fromJsonString(String json) {
    final map = jsonDecode(json);
    return UserModel.fromJson(map);
  }

  Future<void> save() async {
    await Future.delayed(Duration(seconds: 2));
  }
}

Future<void> main() async {
  const u1 = UserModel('Luiz', 'Ventura');
  const u2 = UserModel('Luiz', 'Ventura');
  print(identical(u1, u2));
  await u1.save();
  print(u1.fullName);
}
```

The abode code will output `true` and then after 2 seconds it will output the full name.
Another way to accomplish that is identical to JavaScript. Take a look:

```Dart 
main() {
  const u1 = UserModel('Luiz', 'Ventura');
  const u2 = UserModel('Luiz', 'Ventura');
  print(identical(u1, u2));
  u1.save().then((_) => print(u1.fullName));
}
```

The difference is that, as there is no parameter for the callback, we must use `_` (underscore) to indicate the absence of parameters and the parenthesis are also required. However, this second approached is less used and less recommended as it makes the code longer.  
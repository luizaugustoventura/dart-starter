To create a `class` in Dart, you use the `class ClassName { }` syntax. The **constructor** in Dart is the name of the class itself. For example: 

```Dart
class UserModel {
  String firstName;
  String lastName;

  UserModel(this.firstName, this.lastName);
}
```
> ##### Important
> Whenever you want to create a constant in your class' properties, you must always use the `final` keyword and never the `const` keyword.

The constructor must be done this way because Dart needs all the properties from a class to be assigned before they will be used. And the code after `UserModel()` within curly braces will be run after the instance is created. That's why you cannot do that.
If you try to assign the properties inside the curly braces, you are basically saying that the class' properties are firstly `null` and then, after it is instantiated, you will then assign their values. And this will give you an error.
Also, when you will instantiate objects, the keyword `new` is optional and not recommended. So instead of using `var user = new UserModel()`, you'd rather use `var user = UserModel()`.

##### Access Modifiers

Different from many languages Dart does not provide keywords like `private`, `public`, `protected`, `internal` to manipulate **access modifiers**. Methods and properties can only be **public** or **private** in Dart.
Every method or property in a Dart class will be **public** by default. To turn a method or property **private** its name must start with `_` (underscore). For example:

```Dart
class UserModel {
  String firstName;
  String lastName;
  final String _fullName;

  UserModel(this.firstName, this.lastName)
    : _fullName = '$firstName $lastName';
}
```

In this example, the `firstName` and `lastName` properties are **public**, as they were not modified. However, the `fullName` property is **private** as it starts with `_ `. Also, every private property must be `final`.

##### Preventing class inheritance

If you don't want other classes to inherit the class you're writing, you can use the `@sealed` decorator from the meta package or the `final` keyword. See the examples:

```Dart
import 'package:meta/meta.dart';

@sealed
class UserModel {
  String firstName;
  String lastName;

  UserModel(this.firstName, this.lastName);
}
```

OR

```Dart
final class UserModel {
  String firstName;
  String lastName;

  UserModel(this.firstName, this.lastName);
}
```

##### Creating immutable classes

If you want to init a class and its properties to no longer be editable, you can use the `@immutable` decorator from the meta package. When using this decorator, every property must be `final`. Example:

```Dart
import 'package:meta/meta.dart';

@immutable
class UserModel {
  final String firstName;
  final String lastName;

  UserModel(this.firstName, this.lastName);
}
```

##### Computed properties in the constructor

As we learned, in the constructor, all the code within `{}` is executed after the object is initialized. For that reason, we cannot pass a property inside those curly braces receiving the values of another property or parameter, just like we would in other languages such as Java.
So, if you wanted to set the values for **firstName** and **lastName** and then set both these properties as computed values to another **fullName** property for example, the latter don't necessarily has to be passed to the constructor, but actually we can assign it dynamically. In order to do that, we can do the following:

```Dart
class UserModel {
  String firstName;
  String lastName;
  String fullName;

  UserModel(this.firstName, this.lastName)
    : fullName = '$firstName $lastName';
}
```

By doing that, we are defining all properties in the constructor and computing the values of `firstName` and `lastName` to `fullName`.
Keep in mind that the code after `:` is still part of the **constructor**. Only the code in the `{}` is executed after the object is constructed.

##### Named Constructors

Dart gives you the possibility to define multiple constructors for your classes using **named constructors**.
Say you want to initialize your object from an API response, for example. In Dart, you can create another constructor specifically for that case. Take a look:

```Dart
class UserModel {
  String firstName;
  String lastName;
  String fullName;

  UserModel(this.firstName, this.lastName)
    : fullName = '$firstName $lastName';

  UserModel.fromJson(Map json)
    : this(json['firstName'], json['lastName']);
}
```

So we defined a constructor that is receiving a value in a different format and called the **default constructor** to initialize the object with these values.
You can also to the like this:

```Dart
class UserModel {
  String firstName;
  String lastName;
  String fullName;

  UserModel(this.firstName, this.lastName)
    : fullName = '$firstName $lastName';

  UserModel.fromJson(Map json)
    : firstName = json['firstName'],
      lastName = json['lastName'],
      fullName = '${json['firstName']} ${json['lastName']}';
}
```

> *P.S. In this case, we had to pass the `${}` to the string interpolator, as the `'` on the outside is conflicting with the `'` on the inside. It is recommended to use the `${}` only when it is needed.*

##### Factory constructor

If you have to do something before calling a **constructor** such as rearranging data, it might be useful to create a **factory constructor**.
Say you have a named constructor to instantiate a class from a **json object**, but instead of that you have a stringified json. In this case you can do the following:

```Dart
class UserModel {
  String firstName;
  String lastName;
  String fullName;

  UserModel(this.firstName, this.lastName) : fullName = '$firstName $lastName';

  UserModel.fromJson(Map json) : this(json['firstName'], json['lastName']);

  factory UserModel.fromJsonString(String json) {
    final map = jsonDecode(json);
    return UserModel.fromJson(map);
  }
}
```

> *P.S. You might think the **factory syntax** is cleaner than the **named constructor syntax** with all of that verbose after the `:`. Unless when you want to have a named constructor which is a sort of shortcut to the default constructor, but passes a default value to one or more of its parameters*

##### Constructor as const

It is possible to prefix a constructor with the `const` keyword, though it's not really common. 
Let's examine the two following Dart programs:

```Dart
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
}

main() {
  var u1 = UserModel('Luiz', 'Ventura');
  var u2 = UserModel('Luiz', 'Ventura');

  print(identical(u1, u2));
}
```

```Dart
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
}

main() {
  const u1 = UserModel('Luiz', 'Ventura');
  const u2 = UserModel('Luiz', 'Ventura');

  print(identical(u1, u2));
}
```

The execution of the **first one** will output `false` because each object represents a different instance. Thinking about memory allocation, each one will be a different position in memory.

Looking into the **second one**, as the constructor was prefixed with the `const` keyword, you can create an instance using `const` as well. In this case the output will be `true`.
This happens because `const` is a special type of variable in Dart, as the compiler has a memory allocation table dedicated to constants.
If you declare the constructor as `const` and instantiate and object that has the same type as another one and the values of all their properties are equal, Dart will not generate two different instances. 
Dart will create a hash for a `const` element and place it in a special memory position. When another element is generated with the same values, Dart will reuse that existent instance.

> *P.S. This is a good practice in some cases, though you won't see it very often in Dart programs. `final` will suit your needs 99% of the time.*
> *Although, when you are working on Flutter projects, specifically on the UI part of them, you might have lots of interface components that are equal. This is a situation where the **const constructor** gets really useful as it will prevent multiple instances of the same component. However, the performance gains are not significant.*
> *Still talking about Flutter, when using its **setState** (Flutter's native way of managing state), whenever a variable from a component's state is changed, it'll render everything using that component from that point down the tree. As consequence, you'll end up rebuilding many components. Using **const** will slightly improve performance because Flutter doesn't need to create new instances for the children of that component that will be reloaded.*
> *Although, **setState** is not a common way to manage state in the Flutter community. People prefer using libraries like **BLoC, MobX and GetX** to make it easier, as they will update exactly the Widget we want. Concluding, you're likely to never use this `const` way of creating variables, but it's good to know how it works.*

##### Creating interfaces

Interfaces themselves are not supported by Dart, but you can create an **abstract class** to reach the same. For example:

```Dart
abstract class UseCase {
  void execute();
}
```

A cool thing about abstract classes in Dart is the fact that you can use them for both **inheritance and implementation**. So, if the above `execute()` method does anything and you instead of implementing the class, you **extend** from it, you will get that method. And if you **implement** it, you will have to overwrite the `execute()` method with your implementation anyway.

Despite the extra super powers for being an **abstract class**, in the real world you will often end up using it as an **interface**.
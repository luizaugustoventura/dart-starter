Dart is a typed language, so you must specify a type when declaring a variable. However, **type inference is supported**, so if you know what value is going to be assigned at declaration time, you can use just the `var` keyword to declare your variable.

##### Lists and Sets

Instead of the traditional **array**, in Dart we have two special types: **List** and **Set**. 

##### List

The List is basically an array, just like we know from JavaScript, Java, C, etc. For example:

```Dart
main() {
  List<int> numList = [1, 2, 3];
}
```

##### Set

A Set is a sort a compact variant of List as it is lighter, does not have sorting, and also doesn't take duplicated elements. For example:

```Dart
main() {
  Set<int> numSet = {1, 2, 3};
}
```

##### Map

A Map in Dart is similar to a JSON. It's a **key - value** element. For example:

```Dart
main() {
  var numMap = {'option1': 1, 'option2': 2, 'option3': 3};
}
```

> *P.S. List, Set and Map support type inference, so it's not required to explicitly set a type.*
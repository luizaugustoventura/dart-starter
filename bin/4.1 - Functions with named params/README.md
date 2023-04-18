When you have functions or classes that will receive many parameters, it is recommended to use **named params**. For example:

```Dart
int sum({int n1, int n2}) {
  return n1 + n2;
}

main() {
  var x = sum(n1: 1, n2: 2);
  print(x);
}
```

> #### Important
>
> When using **named params**, every parameter will become **optional** and consequently be `null`.

With that in mind, you can also set default values for the parameters as in the example below:

```Dart
int sum({int n1 = 1, int n2 = 2}) {
  return n1 + n2;
}

main() {
  var x = sum(n1: 1, n2: 2);
  print(x);
}
```

##### Turning parameters required

If you want to force parameters to be required, you need to use the `required` keyword. For example:

```Dart
int sum({required int n1, required int n2}) {
  return n1 + n2;
}

main() {
  var x = sum(n1: 1, n2: 2);
  print(x);
}
```

###### Extra: Syntax sugar for shortening functions

When you have a function that only one instruction, you can use `=>` and remove the `return` as in the example below:


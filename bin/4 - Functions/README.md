Dart functions will take their **return type** at the beginning of their declaration, such as:

```Dart
int sum(int a, int b) {
  return a + b;
}
```

But if you don't specify a type, it will be taken as `dynamic` (equivalent to Typescript's `any`). Besides that, you will not get any help from your editor. For example:

```Dart
sum(a, b) {
  return a + b;
}

main() {
  var x = sum(1, 2);
  print(x.isEven);
}
```

The above code will work perfectly even with Dart not knowing `x` will be an `int`. However, your editor will not know the `isEven` getter is available.
Going a bit further, if you type something like `isEvent` by mistake, the Dart compiler will not complain, it will simply trust you, as it is `dynamic`. But during the execution you will have a crash. On the other hand, if you specify the return type as `int`, the compiler you will give you an error, because the `int` class does not have a method named `isEvent`.

With all that in mind, it is highly recommended to specify the types of your variables and functions whenever you can, rather than letting the editor guess them for you.

##### Optional parameters

If you want a function to take one or more optional parameters, just type them within brackets, as in the example bellow:

```Dart
int sum(int n1, [int n2]) {
  return n1 + n2;
}
```

In this case `n2` is an optional parameter.

> #### Important
>
> Everything in Dart inherits from `object`, so the default value for every not initialized variable will be `null`.

To handle this optional parameter, you can use the following shorthand:

```Dart
int sum(int n1, [int n2]) {
  return n1 + (n2 ?? 0);
}
```

> #### Update
>
> In the newer Dart versions (starting from V2), the `?` was introduced to specify an optional param, so you can use both methods. Example:
>
> ```Dart
> int sum(int n1, int? n2) {
>   return n1 + (n2 ?? 0);
> }
>```

##### Specifying default values for parameters

Continuing from the example above, you can also do the following:

```Dart
int sum(int n1, [int n2 = 0]) {
  return n1 + n2;
}
```
The above code will take `0` as the value for `n2` in case it is not passed.


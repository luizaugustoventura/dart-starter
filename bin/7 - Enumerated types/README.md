Dart unlike a few languages supports **enumerated types**.

Whenever you want to work with a fixed range of values preventing users from typing invalid inputs, say a marital status field, for example, you can use an `enum`.

To use and `enum` in Dart you will use the `enum` keyword preceding its name and its possible values within `{}`. For example:

```Dart
enum MaritalStatus {
  single,
  married,
  divorced,
}
```
sum(n1, n2) {
  return n1 + n2;
}

int subtract(int n1, int n2) {
  return n1 - n2;
}

main() {
  var x = sum(1, 2);
  print(x);
  print(x.isEven);

  var y = subtract(2, 1);
  print(y);
  print(y.isEven);
}
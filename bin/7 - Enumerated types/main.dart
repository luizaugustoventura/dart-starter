enum MaritalStatus {
  single,
  married,
  divorced,
}

getMaritalStatus(MaritalStatus maritalStatus) {
  switch (maritalStatus) {
    case MaritalStatus.single: return 'Single';
    case MaritalStatus.married: return 'Married';
    case MaritalStatus.divorced: return 'Divorced';
  }
}

main() {
  var maritalStatus = MaritalStatus.single;
  print(getMaritalStatus(maritalStatus));
}
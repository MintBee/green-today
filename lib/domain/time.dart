extension DateTimeInequality on DateTime {
  bool operator < (DateTime rhs) {
    return this.isBefore(rhs);
  }

  bool operator > (DateTime rhs) {
    return this.isAfter(rhs);
  }

  bool operator >= (DateTime rhs) {
    return this > rhs || this == rhs;
  }

  bool operator <= (DateTime rhs) {
    return this < rhs || this == rhs;
  }
}

class SimpleTime {
  int? hour;
  int? minute;

  SimpleTime(this.hour, this.minute);
}
extension FirstLetterUpper on String {
  String toFirstUpperCase() {
    return this[0].toUpperCase() + substring(1);
  }
}

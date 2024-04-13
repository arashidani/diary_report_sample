double zeroSuppress(String input) {
  if (input == '') return 0;
  if (input.contains('.')) {
    // If input contains a decimal point
    List<String> parts = input.split('.');
    // Suppress leading zeros in the integer part
    String integerPart = int.parse(parts[0]).toString();
    // Suppress trailing zeros in the fractional part
    String fractionalPart = parts[1].replaceAll(RegExp(r'0*$'), '');

    if (fractionalPart.isEmpty) {
      // If there are no remaining digits in the fractional part, return only the integer part
      return double.parse(integerPart);
    } else {
      // Otherwise, return the integer part followed by the fractional part
      return double.parse(
          '$integerPart.${fractionalPart.isEmpty ? '0' : fractionalPart}');
    }
  } else {
    // If input does not contain a decimal point, suppress leading zeros
    return double.parse(int.parse(input).toString());
  }
}

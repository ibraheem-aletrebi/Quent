String countryCodeToFlag(String countryCode) {
  if (countryCode.length != 2) return countryCode;

  final upperCased = countryCode.toUpperCase();

  return upperCased.codeUnits.map((char) {
    return String.fromCharCode(char + 127397);
  }).join();
}

class PhoneCountry {
  final String name;
  final String flag;
  final String dialCode;

  const PhoneCountry({
    required this.name,
    required this.flag,
    required this.dialCode,
  });
}

const List<PhoneCountry> defaultPhoneCountries = [
  PhoneCountry(
    name: 'Russia',
    flag: '🇷🇺',
    dialCode: '+7',
  ),
  PhoneCountry(
    name: 'Uzbekistan',
    flag: '🇺🇿',
    dialCode: '+998',
  ),
  PhoneCountry(
    name: 'United States',
    flag: '🇺🇸',
    dialCode: '+1',
  ),
  PhoneCountry(
    name: 'United Kingdom',
    flag: '🇬🇧',
    dialCode: '+44',
  ),
  PhoneCountry(
    name: 'Germany',
    flag: '🇩🇪',
    dialCode: '+49',
  ),
];

class KeystoreConfig {
  final String alias;
  final String password;
  final String keyPassword;
  final int validityYears;
  final String firstName;
  final String lastName;
  final String organizationalUnit;
  final String organization;
  final String city;
  final String state;
  final String countryCode;

  const KeystoreConfig({
    required this.alias,
    required this.password,
    required this.keyPassword,
    this.validityYears = 25,
    this.firstName = 'Developer',
    this.lastName = '',
    this.organizationalUnit = 'Dev',
    this.organization = 'Studio',
    this.city = 'City',
    this.state = 'State',
    this.countryCode = 'US',
  });

  Map<String, dynamic> toJson() => {
        'alias': alias,
        'password': password,
        'keyPassword': keyPassword,
        'validityYears': validityYears,
        'firstName': firstName,
        'lastName': lastName,
        'organizationalUnit': organizationalUnit,
        'organization': organization,
        'city': city,
        'state': state,
        'countryCode': countryCode,
      };

  factory KeystoreConfig.fromJson(Map<String, dynamic> json) => KeystoreConfig(
        alias: json['alias'] as String,
        password: json['password'] as String,
        keyPassword: json['keyPassword'] as String,
        validityYears: json['validityYears'] as int? ?? 25,
        firstName: json['firstName'] as String? ?? '',
        lastName: json['lastName'] as String? ?? '',
        organizationalUnit: json['organizationalUnit'] as String? ?? '',
        organization: json['organization'] as String? ?? '',
        city: json['city'] as String? ?? '',
        state: json['state'] as String? ?? '',
        countryCode: json['countryCode'] as String? ?? '',
      );
}

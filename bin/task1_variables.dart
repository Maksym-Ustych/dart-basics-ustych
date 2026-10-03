void main() {
  print('=== Dart Variables & Types Demo ===');

  demonstrateNumbers();
  demonstrateStrings();
  demonstrateBooleans();
  demonstrateCollections();
  demonstrateNullSafety();
}

void demonstrateNumbers() {
  int age = 20;
  double height = 1.78;
  num score = 95.5;

  print('\nNumbers:');
  print('Age: $age');
  print('Height: $height');
  print('Score: $score');

  print('Age + 5 = ${age + 5}');
  print('Height * 2 = ${height * 2}');

  double convertedAge = age.toDouble();
  print('Converted age: $convertedAge');
}

void demonstrateStrings() {
  String firstName = 'Maksym';
  String lastName = 'Ustych';

  print('\nStrings:');
  print('Full name: $firstName $lastName');
  print('Name length: ${firstName.length}');
  print('Uppercase: ${firstName.toUpperCase()}');
}

void demonstrateBooleans() {
  bool isStudent = true;
  int age = 20;

  print('\nBooleans:');
  print('Is student: $isStudent');
  print('Age >= 18: ${age >= 18}');
}

void demonstrateCollections() {
  List<String> languages = ['Dart', 'Python', 'C++'];
  Set<String> skills = {'Git', 'Flutter', 'Dart'};
  Map<String, int> grades = {'Dart': 95, 'Python': 90};

  print('\nCollections:');
  print('Languages: $languages');
  print('Skills: $skills');
  print('Grades: $grades');
}

void demonstrateNullSafety() {
  String? middleName;
  String name = middleName ?? 'No middle name';

  late String university;
  university = 'Software Engineering';

  print('\nNull Safety:');
  print('Middle name: $name');
  print('University: $university');
}

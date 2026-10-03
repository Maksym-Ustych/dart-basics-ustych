void main() {
  print('=== Dart Functions Demo ===');

  testBasicFunctions();
  testAdvancedFunctions();
  testFunctionalProgramming();
}

int calculateSum(int a, int b) {
  return a + b;
}

double calculateAverage(List<double> numbers) {
  if (numbers.isEmpty) {
    return 0;
  }

  double sum = numbers.reduce((a, b) => a + b);
  return sum / numbers.length;
}

String formatName(
  String firstName,
  String lastName, {
  String? middleName,
  bool uppercase = false,
}) {
  String fullName;

  if (middleName != null && middleName.isNotEmpty) {
    fullName = '$firstName $middleName $lastName';
  } else {
    fullName = '$firstName $lastName';
  }

  return uppercase ? fullName.toUpperCase() : fullName;
}

int fibonacci(int n) {
  if (n <= 1) {
    return n;
  }

  return fibonacci(n - 1) + fibonacci(n - 2);
}

int factorial(int n) {
  if (n <= 1) {
    return 1;
  }

  return n * factorial(n - 1);
}

void testBasicFunctions() {
  print('\nBasic Functions:');

  int sum = calculateSum(10, 5);
  print('10 + 5 = $sum');

  double average = calculateAverage([80, 90, 100]);
  print('Average: $average');
}

void testAdvancedFunctions() {
  print('\nAdvanced Functions:');

  String name1 = formatName('Maksym', 'Ustych');
  print('Name: $name1');

  String name2 = formatName(
    'Maksym',
    'Ustych',
    middleName: 'Oleksandrovych',
    uppercase: true,
  );
  print('Full name: $name2');

  print('Fibonacci(8): ${fibonacci(8)}');
  print('Factorial(5): ${factorial(5)}');
}

void testFunctionalProgramming() {
  print('\nFunctional Programming:');

  List<int> numbers = [1, 2, 3, 4, 5, 6];

  List<int> doubled = numbers.map((number) => number * 2).toList();
  print('Doubled: $doubled');

  List<int> evenNumbers = numbers.where((number) => number.isEven).toList();
  print('Even numbers: $evenNumbers');

  int total = numbers.fold(0, (sum, number) => sum + number);
  print('Sum with fold: $total');

  int multiplier = 3;

  int multiply(int value) {
    return value * multiplier;
  }

  print('Closure example: ${multiply(10)}');
}

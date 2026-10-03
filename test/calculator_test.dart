import 'package:test/test.dart';
import 'package:dart_basics_ustych/utils/calculator.dart';

void main() {
  group('Calculator tests', () {
    test('Addition', () {
      expect(Calculator.add(2, 3), 5);
    });

    test('Subtraction', () {
      expect(Calculator.subtract(10, 4), 6);
    });

    test('Multiplication', () {
      expect(Calculator.multiply(3, 4), 12);
    });

    test('Division', () {
      expect(Calculator.divide(10, 2), 5);
    });

    test('Division by zero throws error', () {
      expect(() => Calculator.divide(10, 0), throwsArgumentError);
    });
  });
}

import 'package:dart_basics_ustych/utils/calculator.dart';
import 'package:test/test.dart';

void main() {
  group('Calculator tests', () {
    test('Addition', () {
      expect(Calculator.add(2, 3), 5);
    });

    test('Addition with negative numbers', () {
      expect(Calculator.add(-5, -3), -8);
    });

    test('Subtraction', () {
      expect(Calculator.subtract(10, 4), 6);
    });

    test('Subtraction resulting in negative value', () {
      expect(Calculator.subtract(4, 10), -6);
    });

    test('Multiplication', () {
      expect(Calculator.multiply(3, 4), 12);
    });

    test('Multiplication by zero', () {
      expect(Calculator.multiply(15, 0), 0);
    });

    test('Division', () {
      expect(Calculator.divide(10, 2), 5);
    });

    test('Division with decimal result', () {
      expect(Calculator.divide(5, 2), 2.5);
    });

    test('Division by zero throws error', () {
      expect(() => Calculator.divide(10, 0), throwsArgumentError);
    });
  });
}
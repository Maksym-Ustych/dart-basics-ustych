import 'package:dart_basics_ustych/utils/data_processor.dart';
import 'package:test/test.dart';

void main() {
  group('DataProcessor tests', () {
    test('Filter even numbers', () {
      final result = DataProcessor.filterEvenNumbers([1, 2, 3, 4, 5, 6]);

      expect(result, [2, 4, 6]);
    });

    test('Filter even numbers from empty list', () {
      final result = DataProcessor.filterEvenNumbers([]);

      expect(result, isEmpty);
    });

    test('Count words', () {
      final result = DataProcessor.countWords('Dart Dart Flutter');

      expect(result['dart'], 2);
      expect(result['flutter'], 1);
    });

    test('Count words ignores case', () {
      final result = DataProcessor.countWords('Dart dart DART');

      expect(result['dart'], 3);
    });

    test('Count words ignores punctuation', () {
      final result = DataProcessor.countWords('Dart, Dart! Flutter.');

      expect(result['dart'], 2);
      expect(result['flutter'], 1);
    });
  });
}
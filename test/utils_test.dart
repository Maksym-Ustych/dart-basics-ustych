import 'package:test/test.dart';
import 'package:dart_basics_ustych/utils/data_processor.dart';

void main() {
  group('DataProcessor tests', () {
    test('Filter even numbers', () {
      final result = DataProcessor.filterEvenNumbers([1, 2, 3, 4, 5, 6]);

      expect(result, [2, 4, 6]);
    });

    test('Count words', () {
      final result = DataProcessor.countWords('Dart Dart Flutter');

      expect(result['dart'], 2);
      expect(result['flutter'], 1);
    });
  });
}

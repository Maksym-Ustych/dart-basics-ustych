import 'package:dart_basics_ustych/utils/data_processor.dart';

void main() {
  print('=== Performance Benchmark ===');

  final numbers = List<int>.generate(100000, (index) => index);

  final stopwatch = Stopwatch()..start();

  final evenNumbers = DataProcessor.filterEvenNumbers(numbers);

  stopwatch.stop();

  print('Input size: ${numbers.length}');
  print('Even numbers found: ${evenNumbers.length}');
  print('Execution time: ${stopwatch.elapsedMicroseconds} microseconds');

  final secondStopwatch = Stopwatch()..start();

  final doubled = numbers.map((number) => number * 2).toList();

  secondStopwatch.stop();

  print('Doubled numbers: ${doubled.length}');
  print(
    'Map operation time: '
    '${secondStopwatch.elapsedMicroseconds} microseconds',
  );
}
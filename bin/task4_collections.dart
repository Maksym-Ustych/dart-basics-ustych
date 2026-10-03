import 'dart:io';

import 'package:dart_basics_ustych/models/student.dart';
import 'package:dart_basics_ustych/models/university.dart';
import 'package:dart_basics_ustych/utils/data_processor.dart';

void main() {
  print('=== Dart Collections & Data Processing Demo ===');

  demonstrateLists();
  demonstrateSets();
  demonstrateMaps();
  demonstrateAdvancedOperations();
  demonstrateCsvAnalysis();
}

void demonstrateLists() {
  print('\n--- Lists ---');

  final numbers = [1, 2, 3, 4, 5, 6, 7, 8];

  print('Original: $numbers');
  print('Even: ${DataProcessor.filterEvenNumbers(numbers)}');

  final doubled = numbers.map((number) => number * 2).toList();
  print('Doubled: $doubled');

  final sum = numbers.fold(0, (total, number) => total + number);
  print('Sum: $sum');

  final product = numbers.reduce((a, b) => a * b);
  print('Product: $product');
}

void demonstrateSets() {
  print('\n--- Sets ---');

  final setA = {1, 2, 3, 4};
  final setB = {3, 4, 5, 6};

  print('Set A: $setA');
  print('Set B: $setB');
  print('Union: ${setA.union(setB)}');
  print('Intersection: ${setA.intersection(setB)}');
  print('Difference A-B: ${setA.difference(setB)}');
}

void demonstrateMaps() {
  print('\n--- Maps ---');

  final text = 'Dart is great and Dart is fast';

  final wordCount = DataProcessor.countWords(text);

  print('Text: $text');
  print('Word count: $wordCount');

  wordCount.forEach((word, count) {
    print('$word -> $count');
  });
}

void demonstrateAdvancedOperations() {
  print('\n--- Advanced Operations ---');

  final student1 = Student(
    id: 'S001',
    firstName: 'Maksym',
    lastName: 'Ustych',
    birthDate: DateTime(2000, 1, 15),
  );

  final student2 = Student(
    id: 'S002',
    firstName: 'Ivan',
    lastName: 'Petrenko',
    birthDate: DateTime(2001, 7, 20),
  );

  student1.enrollInCourse('C001');
  student1.enrollInCourse('C002');
  student2.enrollInCourse('C001');

  student1.addGrade('C001', 92);
  student1.addGrade('C002', 88);
  student2.addGrade('C001', 75);

  final students = [student1, student2];

  print('\nStudents sorted by GPA:');
  final sorted = DataProcessor.sortStudentsByGPA(students);

  for (final student in sorted) {
    print(student);
  }

  print('\nCommon courses: ${DataProcessor.findCommonCourses(students)}');

  print(
    'Students by year: ${DataProcessor.groupStudentsByYear(students)}',
  );

  print(
    'Average grades: '
    '${DataProcessor.calculateAverageGradesByCourse(students)}',
  );

  final university = University(
    name: 'Demo University',
    students: students,
  );

  print('\nReport:');

  final report = DataProcessor.generateReport(university);

  for (final item in report) {
    print(item);
  }
}

void demonstrateCsvAnalysis() {
  print('\n--- CSV Data Analysis ---');

  final file = File('lib/students_sample.csv');

  if (!file.existsSync()) {
    print('CSV file not found.');
    return;
  }

  final lines = file.readAsLinesSync();

  if (lines.length <= 1) {
    print('CSV file contains no student data.');
    return;
  }

  final grades = <double>[];
  final courseGrades = <String, List<double>>{};

  for (final line in lines.skip(1)) {
    if (line.trim().isEmpty) {
      continue;
    }

    final values = line.split(',');

    if (values.length < 6) {
      continue;
    }

    final id = values[0];
    final firstName = values[1];
    final lastName = values[2];
    final courseId = values[4];
    final grade = double.tryParse(values[5]);

    if (grade == null) {
      continue;
    }

    grades.add(grade);

    courseGrades.putIfAbsent(courseId, () => []);
    courseGrades[courseId]!.add(grade);

    print(
      '$id | $firstName $lastName | '
      'Course: $courseId | Grade: $grade',
    );
  }

  if (grades.isEmpty) {
    print('No valid grades found.');
    return;
  }

  final averageGrade =
      grades.reduce((a, b) => a + b) / grades.length;

  final highestGrade =
      grades.reduce((a, b) => a > b ? a : b);

  final lowestGrade =
      grades.reduce((a, b) => a < b ? a : b);

  print('\nStudents count: ${grades.length}');
  print('Average grade: ${averageGrade.toStringAsFixed(2)}');
  print('Highest grade: $highestGrade');
  print('Lowest grade: $lowestGrade');

  print('\nAverage grade by course:');

  courseGrades.forEach((courseId, courseGradeList) {
    final average =
        courseGradeList.reduce((a, b) => a + b) /
        courseGradeList.length;

    print('$courseId: ${average.toStringAsFixed(2)}');
  });
}
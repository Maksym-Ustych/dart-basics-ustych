import 'dart:convert';
import 'dart:io';

import 'package:dart_basics_ustych/models/student.dart';

void main() async {
  print('=== Dart Async Programming Demo ===');

  await demonstrateFutures();
  await demonstrateStreams();
  await demonstrateFileOperations();
}

Future<String> fetchStudentData(String studentId) async {
  await Future.delayed(const Duration(seconds: 1));

  return 'Student data loaded for ID: $studentId';
}

Future<List<Student>> loadStudentsFromFile(String filename) async {
  final file = File(filename);

  if (!await file.exists()) {
    return [];
  }

  final content = await file.readAsString();
  final decoded = jsonDecode(content) as List<dynamic>;

  return decoded
      .map((item) => Student.fromJson(Map<String, dynamic>.from(item)))
      .toList();
}

Future<void> saveStudentsToFile(List<Student> students, String filename) async {
  final file = File(filename);

  final data = students.map((student) => student.toJson()).toList();

  final jsonText = const JsonEncoder.withIndent('  ').convert(data);

  await file.writeAsString(jsonText);
}

Stream<Student> studentStream() async* {
  final students = [
    Student(
      id: 'S001',
      firstName: 'Maksym',
      lastName: 'Ustych',
      birthDate: DateTime(2000, 1, 15),
    ),
    Student(
      id: 'S002',
      firstName: 'Ivan',
      lastName: 'Petrenko',
      birthDate: DateTime(2001, 7, 20),
    ),
    Student(
      id: 'S003',
      firstName: 'Olena',
      lastName: 'Shevchenko',
      birthDate: DateTime(2002, 3, 10),
    ),
  ];

  for (final student in students) {
    await Future.delayed(const Duration(milliseconds: 500));

    yield student;
  }
}

Future<void> demonstrateFutures() async {
  print('\n--- Futures ---');

  try {
    final results = await Future.wait([
      fetchStudentData('S001'),
      fetchStudentData('S002'),
      fetchStudentData('S003'),
    ]).timeout(const Duration(seconds: 5));

    for (final result in results) {
      print(result);
    }
  } catch (error) {
    print('Future error: $error');
  }
}

Future<void> demonstrateStreams() async {
  print('\n--- Streams ---');

  await for (final student in studentStream()) {
    print('Stream student: ${student.fullName}');
  }
}

Future<void> demonstrateFileOperations() async {
  print('\n--- File Operations ---');

  const filename = 'students_data.json';

  final students = [
    Student(
      id: 'S001',
      firstName: 'Maksym',
      lastName: 'Ustych',
      birthDate: DateTime(2000, 1, 15),
    ),
    Student(
      id: 'S002',
      firstName: 'Ivan',
      lastName: 'Petrenko',
      birthDate: DateTime(2001, 7, 20),
    ),
  ];

  students[0].enrollInCourse('C001');
  students[0].addGrade('C001', 92);

  students[1].enrollInCourse('C001');
  students[1].addGrade('C001', 75);

  try {
    await saveStudentsToFile(students, filename);

    print('Students saved to $filename');

    final loadedStudents = await loadStudentsFromFile(filename);

    print('Loaded students:');

    for (final student in loadedStudents) {
      print(student);
    }
  } catch (error) {
    print('File operation error: $error');
  }
}

import 'package:dart_basics_ustych/models/student.dart';
import 'package:test/test.dart';

void main() {
  group('Student model tests', () {
    test('Full name is generated correctly', () {
      final student = Student(
        id: 'S001',
        firstName: 'Maksym',
        lastName: 'Ustych',
        birthDate: DateTime(2000, 1, 1),
      );

      expect(student.fullName, 'Maksym Ustych');
    });

    test('Student can enroll in course', () {
      final student = Student(
        id: 'S001',
        firstName: 'Maksym',
        lastName: 'Ustych',
        birthDate: DateTime(2000, 1, 1),
      );

      student.enrollInCourse('C001');

      expect(student.enrolledCourses.contains('C001'), true);
    });

    test('Duplicate course is not added twice', () {
      final student = Student(
        id: 'S001',
        firstName: 'Maksym',
        lastName: 'Ustych',
        birthDate: DateTime(2000, 1, 1),
      );

      student.enrollInCourse('C001');
      student.enrollInCourse('C001');

      expect(student.enrolledCourses.length, 1);
    });

    test('GPA is calculated correctly', () {
      final student = Student(
        id: 'S001',
        firstName: 'Maksym',
        lastName: 'Ustych',
        birthDate: DateTime(2000, 1, 1),
      );

      student.addGrade('C001', 80);
      student.addGrade('C002', 90);

      expect(student.gpa, 85);
    });

    test('GPA is zero when there are no grades', () {
      final student = Student(
        id: 'S001',
        firstName: 'Maksym',
        lastName: 'Ustych',
        birthDate: DateTime(2000, 1, 1),
      );

      expect(student.gpa, 0);
    });

    test('Passed courses are detected correctly', () {
      final student = Student(
        id: 'S001',
        firstName: 'Maksym',
        lastName: 'Ustych',
        birthDate: DateTime(2000, 1, 1),
      );

      student.addGrade('C001', 85);
      student.addGrade('C002', 55);

      expect(student.getPassedCourses(), ['C001']);
    });

    test('Student converts to JSON correctly', () {
      final student = Student(
        id: 'S001',
        firstName: 'Maksym',
        lastName: 'Ustych',
        birthDate: DateTime(2000, 1, 1),
      );

      student.enrollInCourse('C001');
      student.addGrade('C001', 90);

      final json = student.toJson();

      expect(json['id'], 'S001');
      expect(json['firstName'], 'Maksym');
      expect(json['lastName'], 'Ustych');
    });
  });
}
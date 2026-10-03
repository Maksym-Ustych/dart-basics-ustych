import 'package:test/test.dart';
import 'package:dart_basics_ustych/models/student.dart';

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
  });
}

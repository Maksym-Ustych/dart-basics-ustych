import 'package:dart_basics_ustych/models/student.dart';
import 'package:dart_basics_ustych/models/course.dart';
import 'package:dart_basics_ustych/models/university.dart';

void main() {
  print('=== University Management System Demo ===');

  runUniversityDemo();
}

void runUniversityDemo() {
  final university = University(name: 'Demo University');

  final professor = Professor(
    id: 'P001',
    firstName: 'Oleksandr',
    lastName: 'Kostikov',
    birthDate: DateTime(1980, 5, 10),
    department: 'Software Engineering',
    salary: 30000,
  );

  university.professors.add(professor);

  final course1 = Course(
    id: 'C001',
    name: 'Dart Basics',
    description: 'Основи мови Dart',
    credits: 4,
    instructor: professor.fullName,
  );

  final course2 = Course(
    id: 'C002',
    name: 'Flutter Development',
    description: 'Розробка мобільних застосунків',
    credits: 5,
    instructor: professor.fullName,
    prerequisites: ['C001'],
  );

  university.courses.addAll([course1, course2]);

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

  university.addStudent(student1);
  university.addStudent(student2);

  student1.enrollInCourse('C001');
  student2.enrollInCourse('C001');

  student1.addGrade('C001', 92);
  student2.addGrade('C001', 75);

  if (course2.canStudentEnroll(student1)) {
    student1.enrollInCourse('C002');
  }

  if (course2.canStudentEnroll(student2)) {
    student2.enrollInCourse('C002');
  }

  print('\nStudents:');
  for (final student in university.students) {
    print(student);
  }

  print('\nCourses:');
  for (final course in university.courses) {
    print(course);
  }

  print('\nProfessors:');
  for (final prof in university.professors) {
    print(prof);
  }

  print('\nStudents in C001:');
  for (final student in university.getStudentsByCourse('C001')) {
    print(student.fullName);
  }

  print('\nAvailable courses for ${student1.fullName}:');
  for (final course in university.getAvailableCoursesForStudent(student1.id)) {
    print(course.name);
  }

  print('\nUniversity statistics:');
  final statistics = university.generateStatistics();

  statistics.forEach((key, value) {
    print('$key: $value');
  });

  print('\nSearch student by ID:');
  final foundStudent = university.findStudentById('S001');

  if (foundStudent != null) {
    print(foundStudent);
  }
}

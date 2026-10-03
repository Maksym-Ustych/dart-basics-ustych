import 'student.dart';
import 'course.dart';

abstract class Person {
  final String id;
  final String firstName;
  final String lastName;
  final DateTime birthDate;

  Person({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.birthDate,
  });

  String get fullName;

  int get age;

  String get role;
}

class Professor extends Person {
  final String department;
  final List<String> taughtCourses;
  final double salary;

  Professor({
    required super.id,
    required super.firstName,
    required super.lastName,
    required super.birthDate,
    required this.department,
    required this.salary,
    List<String>? taughtCourses,
  }) : taughtCourses = taughtCourses ?? [];

  @override
  String get fullName => '$firstName $lastName';

  @override
  int get age {
    final now = DateTime.now();
    int age = now.year - birthDate.year;

    if (now.month < birthDate.month ||
        (now.month == birthDate.month && now.day < birthDate.day)) {
      age--;
    }

    return age;
  }

  @override
  String get role => 'Professor';

  void addCourse(String courseId) {
    if (!taughtCourses.contains(courseId)) {
      taughtCourses.add(courseId);
    }
  }

  @override
  String toString() {
    return '$role: $fullName, department: $department';
  }
}

class University {
  final String name;
  final List<Student> students;
  final List<Professor> professors;
  final List<Course> courses;

  University({
    required this.name,
    List<Student>? students,
    List<Professor>? professors,
    List<Course>? courses,
  }) : students = students ?? [],
       professors = professors ?? [],
       courses = courses ?? [];

  void addStudent(Student student) {
    students.add(student);
  }

  void removeStudent(String studentId) {
    students.removeWhere((student) => student.id == studentId);
  }

  Student? findStudentById(String id) {
    for (final student in students) {
      if (student.id == id) {
        return student;
      }
    }

    return null;
  }

  List<Student> getStudentsByCourse(String courseId) {
    return students
        .where((student) => student.enrolledCourses.contains(courseId))
        .toList();
  }

  List<Course> getAvailableCoursesForStudent(String studentId) {
    final student = findStudentById(studentId);

    if (student == null) {
      return [];
    }

    return courses.where((course) => course.canStudentEnroll(student)).toList();
  }

  Map<String, dynamic> generateStatistics() {
    double averageGpa = 0;

    if (students.isNotEmpty) {
      averageGpa =
          students.map((student) => student.gpa).reduce((a, b) => a + b) /
          students.length;
    }

    return {
      'university': name,
      'studentsCount': students.length,
      'professorsCount': professors.length,
      'coursesCount': courses.length,
      'averageGpa': averageGpa,
    };
  }
}

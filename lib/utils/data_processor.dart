import '../models/student.dart';
import '../models/university.dart';

class DataProcessor {
  static List<int> filterEvenNumbers(List<int> numbers) {
    return numbers.where((number) => number.isEven).toList();
  }

  static Map<String, int> countWords(String text) {
    final words = text
        .toLowerCase()
        .replaceAll(RegExp(r'[^\w\s]'), '')
        .split(RegExp(r'\s+'))
        .where((word) => word.isNotEmpty);

    final result = <String, int>{};

    for (final word in words) {
      result[word] = (result[word] ?? 0) + 1;
    }

    return result;
  }

  static List<Map<String, dynamic>> sortStudentsByGPA(List<Student> students) {
    final sortedStudents = List<Student>.from(students);

    sortedStudents.sort((a, b) => b.gpa.compareTo(a.gpa));

    return sortedStudents
        .map(
          (student) => {
            'id': student.id,
            'name': student.fullName,
            'gpa': student.gpa,
          },
        )
        .toList();
  }

  static Set<String> findCommonCourses(List<Student> students) {
    if (students.isEmpty) {
      return {};
    }

    Set<String> commonCourses = students.first.enrolledCourses.toSet();

    for (final student in students.skip(1)) {
      commonCourses = commonCourses.intersection(
        student.enrolledCourses.toSet(),
      );
    }

    return commonCourses;
  }

  static Map<String, List<Student>> groupStudentsByYear(
    List<Student> students,
  ) {
    final result = <String, List<Student>>{};

    for (final student in students) {
      final year = student.birthDate.year.toString();

      result.putIfAbsent(year, () => []);
      result[year]!.add(student);
    }

    return result;
  }

  static Map<String, double> calculateAverageGradesByCourse(
    List<Student> students,
  ) {
    final courseGrades = <String, List<double>>{};

    for (final student in students) {
      student.grades.forEach((courseId, grade) {
        courseGrades.putIfAbsent(courseId, () => []);
        courseGrades[courseId]!.add(grade);
      });
    }

    final averages = <String, double>{};

    courseGrades.forEach((courseId, grades) {
      final total = grades.reduce((a, b) => a + b);
      averages[courseId] = total / grades.length;
    });

    return averages;
  }

  static List<Map<String, dynamic>> generateReport(University university) {
    return university.students
        .map(
          (student) => {
            'id': student.id,
            'name': student.fullName,
            'gpa': student.gpa,
            'courses': student.enrolledCourses,
            'passedCourses': student.getPassedCourses(),
          },
        )
        .toList();
  }
}

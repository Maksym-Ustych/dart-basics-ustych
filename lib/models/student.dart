class Student {
  final String id;
  final String firstName;
  final String lastName;
  final DateTime birthDate;
  final List<String> enrolledCourses;
  final Map<String, double> grades;

  Student({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.birthDate,
    List<String>? enrolledCourses,
    Map<String, double>? grades,
  }) : enrolledCourses = enrolledCourses ?? [],
       grades = grades ?? {};

  String get fullName => '$firstName $lastName';

  int get age {
    final now = DateTime.now();
    int age = now.year - birthDate.year;

    if (now.month < birthDate.month ||
        (now.month == birthDate.month && now.day < birthDate.day)) {
      age--;
    }

    return age;
  }

  double get gpa {
    if (grades.isEmpty) {
      return 0;
    }

    final total = grades.values.reduce((a, b) => a + b);
    return total / grades.length;
  }

  void enrollInCourse(String courseId) {
    if (!enrolledCourses.contains(courseId)) {
      enrolledCourses.add(courseId);
    }
  }

  void addGrade(String courseId, double grade) {
    grades[courseId] = grade;
  }

  List<String> getPassedCourses() {
    return grades.entries
        .where((entry) => entry.value >= 60)
        .map((entry) => entry.key)
        .toList();
  }

  @override
  String toString() {
    return 'Student(id: $id, name: $fullName, age: $age, GPA: ${gpa.toStringAsFixed(2)})';
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'birthDate': birthDate.toIso8601String(),
      'enrolledCourses': enrolledCourses,
      'grades': grades,
    };
  }

  factory Student.fromJson(Map<String, dynamic> json) {
    return Student(
      id: json['id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      birthDate: DateTime.parse(json['birthDate']),
      enrolledCourses: List<String>.from(json['enrolledCourses'] ?? []),
      grades: Map<String, double>.from(
        (json['grades'] ?? {}).map(
          (key, value) => MapEntry(key, (value as num).toDouble()),
        ),
      ),
    );
  }
}

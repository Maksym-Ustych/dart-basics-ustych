# Dart Basics — Ustych

Практична робота №4 з дисципліни «Програмування для мобільних платформ».

Тема: «Основи мови Dart».

## Опис проєкту

Проєкт містить п'ять окремих програм мовою Dart, які демонструють:

- базові типи даних і змінні;
- функції та функціональне програмування;
- об'єктно-орієнтоване програмування;
- роботу з колекціями;
- асинхронне програмування та роботу з файлами.
Також у проєкті реалізовано:

- моделі студента, курсу та університету;
- допоміжні класи для обробки даних;
- модульні тести для перевірки роботи програми.

## Вимоги

Для запуску проєкту потрібен Dart SDK версії 3.0.0 або новішої.

Перевірити встановлену версію можна командою:

```bash
dart --version
```
## Структура проєкту

```text
dart_basics_ustych/
├── bin/
│   ├── task1_variables.dart
│   ├── task2_functions.dart
│   ├── task3_classes.dart
│   ├── task4_collections.dart
│   └── task5_async.dart
├── lib/
│   ├── models/
│   │   ├── student.dart
│   │   ├── course.dart
│   │   └── university.dart
│   └── utils/
│       ├── calculator.dart
│       └── data_processor.dart
├── test/
│   ├── calculator_test.dart
│   ├── models_test.dart
│   └── utils_test.dart
├── README.md
└── pubspec.yaml
```

## Запуск завдань

### Завдання 1 — Змінні та типи даних

```bash
dart run bin/task1_variables.dart
```

### Завдання 2 — Функції

```bash
dart run bin/task2_functions.dart
```

### Завдання 3 — ООП та система університету

```bash
dart run bin/task3_classes.dart
```

### Завдання 4 — Колекції та обробка даних

```bash
dart run bin/task4_collections.dart
```

### Завдання 5 — Асинхронне програмування

```bash
dart run bin/task5_async.dart
```
## Приклад використання класу Student

```dart
final student = Student(
  id: 'S001',
  firstName: 'Maksym',
  lastName: 'Ustych',
  birthDate: DateTime(2000, 1, 1),
);

student.enrollInCourse('C001');
student.addGrade('C001', 90);

print(student.fullName);
print(student.gpa);
```
## Перевірка якості коду

Аналіз коду:

```bash
dart analyze
```

Форматування коду:

```bash
dart format .
```

Запуск тестів:

```bash
dart test
```
## Тестування

У проєкті реалізовані unit-тести для:

- класу `Calculator`;
- моделі `Student`;
- класу `DataProcessor`.

Поточний результат тестування:

```text
All tests passed!
```

## Автор

Устич Максим
import 'package:isro/models/Questions.dart';

class Subject {
  final String name;
  final int id;
  final List<Question> questions;

  const Subject({
    required this.name,
    required this.id,
    required this.questions,
  });
}

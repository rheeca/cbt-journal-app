import 'package:uuid/uuid.dart';

class Goal {
  String id;
  String title;
  String description;

  Goal({required this.id, required this.title, required this.description});
  Goal.createNew({this.title = 'Untitled', this.description = ''})
      : id = const Uuid().v4();
}

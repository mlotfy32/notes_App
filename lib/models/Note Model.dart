import 'package:hive/hive.dart';
part 'Note Model.g.dart';
@HiveType(typeId: 0)
class Note_Model extends HiveObject {
  @HiveField(0)
   String title;
  @HiveField(1)
   String content;
  @HiveField(2)
  final String date;
  @HiveField(3)
   int color;

  Note_Model(
      {required this.title,
      required this.content,
      required this.date,
      required this.color});
}

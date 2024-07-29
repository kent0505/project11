import 'package:hive_flutter/hive_flutter.dart';

class Quiz {
  final int id;
  final String by;
  final String asset;
  final String date;
  final String question;
  List<Comment> comments;

  Quiz({
    required this.id,
    required this.by,
    required this.asset,
    required this.date,
    required this.question,
    required this.comments,
  });
}

@HiveType(typeId: 1)
class Comment {
  @HiveField(0)
  final int quizID;
  @HiveField(1)
  final String by;
  @HiveField(2)
  final String asset;
  @HiveField(3)
  final String date;
  @HiveField(4)
  final String title;
  @HiveField(5)
  final bool current;

  Comment({
    required this.quizID,
    required this.by,
    required this.asset,
    required this.date,
    required this.title,
    required this.current,
  });
}

class CommentAdapter extends TypeAdapter<Comment> {
  @override
  final typeId = 1;

  @override
  Comment read(BinaryReader reader) {
    return Comment(
      quizID: reader.read(),
      by: reader.read(),
      asset: reader.read(),
      date: reader.read(),
      title: reader.read(),
      current: reader.read(),
    );
  }

  @override
  void write(BinaryWriter writer, Comment obj) {
    writer.write(obj.quizID);
    writer.write(obj.by);
    writer.write(obj.asset);
    writer.write(obj.date);
    writer.write(obj.title);
    writer.write(obj.current);
  }
}

List<Quiz> quizesListModel = [
  Quiz(
    id: 1,
    by: 'Emily Thompson',
    asset: 'user1',
    date: 'May 13, 2024',
    question:
        'What problems or inconveniences are you experiencing when using the current version of the application?',
    comments: [],
  ),
];

List<Comment> commentsListModel = [
  Comment(
    quizID: 1,
    by: 'Jacob Ramirez',
    asset: 'user2',
    date: 'May 15, 2024',
    title:
        'The app sometimes miscategorizes my expenses, making it hard to keep track.',
    current: false,
  ),
  Comment(
    quizID: 1,
    by: 'Olivia Parker',
    asset: 'user3',
    date: 'May 16, 2024',
    title:
        'The automatic expense categorization is incredibly useful for saving time.',
    current: false,
  ),
];

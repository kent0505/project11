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
    asset: 'user2',
    date: 'May 13, 2024',
    question:
        'What problems or inconveniences are you experiencing when using the current version of the application?',
    comments: [],
  ),
  Quiz(
    id: 2,
    by: 'Ethan Mitchell',
    asset: 'user1',
    date: 'May 14, 2024',
    question: 'Which features do you find most useful in the app, and why?',
    comments: [],
  ),
  Quiz(
    id: 3,
    by: 'Ethan Mitchell',
    asset: 'user1',
    date: 'May 14, 2024',
    question:
        'Are there any features that you rarely or never use? Why do you find them unhelpful?',
    comments: [],
  ),
  Quiz(
    id: 4,
    by: 'Ethan Mitchell',
    asset: 'user1',
    date: 'May 14, 2024',
    question:
        'How easy is it to navigate through the app and find what you need?',
    comments: [],
  ),
  Quiz(
    id: 5,
    by: 'Ethan Mitchell',
    asset: 'user1',
    date: 'May 14, 2024',
    question:
        'Have you encountered any bugs or crashes while using the app? If so, please describe them.',
    comments: [],
  ),
  Quiz(
    id: 6,
    by: 'Ethan Mitchell',
    asset: 'user1',
    date: 'May 14, 2024',
    question:
        'How would you rate the overall performance of the app (e.g., speed, responsiveness)?',
    comments: [],
  ),
  Quiz(
    id: 7,
    by: 'Ethan Mitchell',
    asset: 'user1',
    date: 'May 14, 2024',
    question: 'Are there any features or functionalities you wish the app had?',
    comments: [],
  ),
  Quiz(
    id: 8,
    by: 'Ethan Mitchell',
    asset: 'user1',
    date: 'May 14, 2024',
    question: 'How satisfied are you with the app’s user interface and design?',
    comments: [],
  ),
  Quiz(
    id: 9,
    by: 'Ethan Mitchell',
    asset: 'user1',
    date: 'May 14, 2024',
    question: 'Do you find the app’s notifications helpful or intrusive?',
    comments: [],
  ),
  Quiz(
    id: 10,
    by: 'Ethan Mitchell',
    asset: 'user1',
    date: 'May 14, 2024',
    question: 'How often do you use the app, and for what primary purpose?',
    comments: [],
  ),
  Quiz(
    id: 11,
    by: 'Ethan Mitchell',
    asset: 'user1',
    date: 'May 14, 2024',
    question: 'How likely are you to recommend this app to others, and why?',
    comments: [],
  ),
  Quiz(
    id: 12,
    by: 'Ethan Mitchell',
    asset: 'user1',
    date: 'May 14, 2024',
    question:
        'What improvements would you suggest to enhance your experience with the app?',
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
  Comment(
    quizID: 2,
    by: 'Mia Harris',
    asset: 'user3',
    date: 'May 16, 2024',
    title:
        'I find the expense tracking feature most useful as it allows me to log my spending immediately and accurately.',
    current: false,
  ),
  Comment(
    quizID: 3,
    by: 'Olivia Parker',
    asset: 'user3',
    date: 'May 17, 2024',
    title: 'Aaa',
    current: false,
  ),
  // Comment(
  //   quizID: 2,
  //   by: 'Olivia Parker',
  //   asset: 'user3',
  //   date: 'May 16, 2024',
  //   title:
  //       'The automatic expense categorization is incredibly useful for saving time.',
  //   current: false,
  // ),
];

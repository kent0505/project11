class Quiz {
  final int by;
  final String date;
  final String question;
  final List<Comment> comments;

  Quiz({
    required this.by,
    required this.date,
    required this.question,
    required this.comments,
  });
}

class Comment {
  final String by;
  final String date;
  final String title;

  Comment({
    required this.by,
    required this.date,
    required this.title,
  });
}

class URLs {
  static const host = 'http://localhost:8080';
  static String image(String fileName) => '$host/attachments/$fileName';
}

class CustomExecption implements Exception {
  final String message;

  CustomExecption({required this.message});

  @override
  String toString() => message;
}

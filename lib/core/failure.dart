// ignore_for_file: public_member_api_docs, sort_constructors_first
class Failure {
  final String message;
  // rakan = String   revvan = StackTrace
  final StackTrace stackTrace;
  const Failure(this.message, this.stackTrace);
}


/// Helper function to escape spaces and join arguments for call.
/// Used for desktop platforms.
String parseArgs(List<String> args) {
  final commandList = args.map((arg) => arg.replaceAll(' ', '\\ ')).toList();
  return commandList.join(' ');
}

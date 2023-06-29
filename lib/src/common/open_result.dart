
/// Result of open action
class OpenResult {
  /// Result type
  ResultType type;
  /// Human readable message, adding some context to the possible error result
  String message;

  OpenResult(this.type, {this.message = "done"});

  /// Construct result from the platform channel response
  OpenResult.fromJson(Map<String, dynamic> json)
      : type = _typeFromCode(json['type']),
        message = json['message'];

  static ResultType _typeFromCode(int? typeCode) {
    switch (typeCode) {
      case -1:
        return ResultType.noAppToOpen;
      case -2:
        return ResultType.fileNotFound;
      case -3:
        return ResultType.permissionDenied;
      case -4:
        return ResultType.error;
    }
    return ResultType.done;
  }
}

/// Result type
enum ResultType {
  /// File opened successfully
  done,
  /// File not found
  fileNotFound,
  /// File exists, but system doesn't have an application to handle it
  noAppToOpen,
  /// System denied permission to open the file (Android only)
  permissionDenied,
  /// Generic error, check the message for details
  error,
}

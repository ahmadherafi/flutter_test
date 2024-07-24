enum ExceptionType {
  connectionError,
  // related to http status code exceptions
  notAuthorized,
  notAuthenticated,
  notFound,
  internalServerException,
  serviceUnavailableException,
  pageGone,
  resourceAlreadyExists,
  unAcceptableOperation,
  accountTerminated,
  notVerified,

  // related to bad request status code
  // related to auth requests
  emailAlreadyExists,
  userNameAlreadyExists,
  passwordInvalid,
  invalidCredentials,
  verifyTokenInvalid,
  resetCodeInvalid,
  invalidResetToken,

  // SQL Lite Exceptions

  duplicatedIdEntry,
  duplicatedColumnName,
  tableNotFound,
  duplicateColumn,
  dataBaseClose,
  columnShouldNotNull,
  syntaxError,

  validationError,

  // socket exception

  // other
  other,
}

class GenericException implements Exception {
  ExceptionType type;
  String errorMessage;
  GenericException({required this.type, this.errorMessage = "Unknown Error"});

  @override
  String toString() {
    return errorMessage;
  }
}

class ValidationError extends GenericException {
  String fieldName;
  ValidationError({required this.fieldName})
      : super(
          type: ExceptionType.validationError,
          errorMessage: "$fieldName is required",
        );
}

Map<String, GenericException> badRequestException = {
  "RESOURCE_ALREADY_EXISTS": GenericException(
    type: ExceptionType.emailAlreadyExists,
    errorMessage: "email_already_exists",
  ),
  "ACCOUNT_TERMINATED": GenericException(
    type: ExceptionType.accountTerminated,
    errorMessage: "account_terminated",
  ),
  "USERNAME_ALREADY_EXISTS": GenericException(
    type: ExceptionType.userNameAlreadyExists,
    errorMessage: "username_already_exists",
  ),
  "PASSWORD_INVALID": GenericException(
    type: ExceptionType.passwordInvalid,
    errorMessage: "invalid_password",
  ),
  "INVALID_CREDENTIALS": GenericException(
    type: ExceptionType.invalidCredentials,
    errorMessage: "invalid_credentials",
  ),
  "VERIFY_TOKEN_INVALID": GenericException(
    type: ExceptionType.verifyTokenInvalid,
    errorMessage: "invalid_verify_token",
  ),
  "RESET_CODE_INVALID": GenericException(
    type: ExceptionType.resetCodeInvalid,
    errorMessage: "invalid_reset_code",
  ),
  "INVALID_RESET_TOKEN": GenericException(
    type: ExceptionType.invalidResetToken,
    errorMessage: "invalid_reset_token",
  ),
  "NOT_VERIFIED": GenericException(
    //*********add***********
    type: ExceptionType.notVerified,
    errorMessage: "User is not verified",
  ),
  "UNACCEPTABLE_OPERATION": GenericException(
    type: ExceptionType.unAcceptableOperation,
    errorMessage: "un_acceptable_operation",
  ),
  "RESOURCE_NOT_FOUND": GenericException(
    type: ExceptionType.notFound,
    errorMessage: "resource_not_found",
  ),
  "INTERNAL_SERVER_ERROR": GenericException(
    type: ExceptionType.internalServerException,
    errorMessage: "internal_error",
  ),
  "NOT_AUTHENTICATED": GenericException(
    type: ExceptionType.notAuthenticated,
    errorMessage: "not_authenticated",
  ),
  "NOT_AUTHORIZED": GenericException(
    type: ExceptionType.notAuthorized,
    errorMessage: "you_are_not_authorized",
  ),
};

Map<int, GenericException> statusCodesException = {
  400: GenericException(
    type: ExceptionType.notVerified,
    errorMessage: "User is not verified",
  ),
  403: GenericException(
    type: ExceptionType.notAuthorized,
    errorMessage: "you_are_not_authorized",
  ),
  401: GenericException(
    type: ExceptionType.notAuthorized,
    errorMessage: "you_are_not_authorized",
  ),
  404: GenericException(
    type: ExceptionType.notFound,
    errorMessage: "page_not_found",
  ),
  410: GenericException(
    type: ExceptionType.pageGone,
    errorMessage: "page_gone",
  ),
  500: GenericException(
    type: ExceptionType.internalServerException,
    errorMessage: "server_down",
  ),
  503: GenericException(
    type: ExceptionType.serviceUnavailableException,
    errorMessage: "service_unavailable",
  ),
};

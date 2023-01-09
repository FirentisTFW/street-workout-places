abstract class AppError {
  const AppError();
}

class NoNetworkConnectionError extends AppError {
  const NoNetworkConnectionError();
}

class UnknownError extends AppError {
  const UnknownError();
}

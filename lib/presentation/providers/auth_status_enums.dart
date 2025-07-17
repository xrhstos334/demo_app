

enum AuthActionStatus {
  initial,
  loginWaiting,
  loginSuccess,
  loginFailure,
  resetWaiting,
  resetSuccess,
  resetFailure,
  activationWaiting,
  activationSuccess,
  activationFailure,
  message,
}

enum AuthView {
  login,
  signUp,
  forgotPassword,
  back
}
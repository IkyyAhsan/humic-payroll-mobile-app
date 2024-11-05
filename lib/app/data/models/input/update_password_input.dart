class UpdatePasswordInput {
  String currentPassword;
  String newPassword;
  String newPasswordConfirmation;

  UpdatePasswordInput({
    required this.currentPassword,
    required this.newPassword,
    required this.newPasswordConfirmation,
  });
}

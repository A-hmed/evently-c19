abstract class AppValidator {
  static String? nameValidator(String? name) {
    if (name == null || name.isEmpty) {
      return "Name cannot be empty";
    }
    if (name.length < 3) {
      return "Name must be at least 3 characters long";
    }
    return null;
  }

  static String? emailValidator(String? email) {
    if (email == null || email.isEmpty) {
      return "Email cannot be empty";
    }
    if (email.length < 3) {
      return "Email must be at least 3 characters long";
    }
    if (!RegExp(
      r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$",
    ).hasMatch(email)) {
      return "Invalid email";
    }
    return null;
  }

  static String? passwordValidator(String? password) {
    if (password == null || password.isEmpty) {
      return "Password cannot be empty";
    }
    if (password.length < 6) {
      return "Password must be at least 6 characters long";
    }
    return null;
  }

  static String? confirmPasswordValidator({
    String? confirmPassword,
    String? password,
  }) {
    if (confirmPassword == null || confirmPassword.isEmpty) {
      return "Confirm password cannot be empty";
    }
    if (confirmPassword != password) {
      return "Passwords do not match";
    }
    return null;
  }
}

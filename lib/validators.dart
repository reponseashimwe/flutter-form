/// Provides validation methods for form fields in the survey application.
class Validators {
  /// Validates a name field. Returns error message if invalid, null if valid.
  /// Checks for empty values, minimum length, and valid characters.
  static String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your name';
    }
    if (value.length < 2) {
      return 'Name must be at least 2 characters long';
    }
    if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(value)) {
      return 'Name can only contain letters and spaces';
    }
    return null;
  }

  /// Validates an email address. Returns error message if invalid, null if valid.
  /// Checks for empty values and proper email format.
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  /// Validates date of birth. Returns error message if invalid, null if valid.
  /// Checks format, future dates, and minimum age requirement.
  static String? validateDOB(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please select your date of birth';
    }

    // should be in the format of yyyy-mm-dd
    if (!RegExp(r'^\d{4}-\d{2}-\d{2}$').hasMatch(value)) {
      return 'Please enter a valid date of birth';
    }

    // not from future
    final dob = DateTime.parse(value);
    final today = DateTime.now();
    if (dob.isAfter(today)) {
      return 'Date of birth cannot be in the future';
    }

    // should be in the past at least 16 years
    final age = today.year - dob.year;
    if (age < 16) {
      return 'You must be at least 16 years old';
    }
    return null;
  }

  /// Validates phone numbers. Returns error message if invalid, null if valid.
  /// Checks for proper format and minimum length.
  static String? validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your phone number';
    }
    if (!RegExp(r'^\+?[\d\s-]{10,}$').hasMatch(value)) {
      return 'Please enter a valid phone number';
    }
    return null;
  }

  /// Validates address field. Returns error message if empty, null if valid.
  static String? validateAddress(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your address';
    }

    return null;
  }

  /// Validates student ID. Returns error message if invalid, null if valid.
  /// Checks for proper format with alphanumeric characters.
  static String? validateStudentId(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your student ID';
    }
    if (!RegExp(r'^[A-Z0-9]{8,}$').hasMatch(value)) {
      return 'Please enter a valid student ID';
    }
    return null;
  }
} 
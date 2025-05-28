import 'package:shared_preferences/shared_preferences.dart';

/// A helper class for managing data in SharedPreferences.
///
/// Before using any of its methods, ensure you call `CacheHelper.init()`
/// once, typically in your `main.dart` file before `runApp()`.
///
/// Example:
/// ```dart
/// void main() async {
///   WidgetsFlutterBinding.ensureInitialized(); // Important
///   await CacheHelper.init();
///   runApp(MyApp());
/// }
/// ```
class CacheHelper {
  static SharedPreferences? _sharedPreferences;

  // Private constructor to prevent instantiation
  CacheHelper._();

  /// Initializes the SharedPreferences instance.
  ///
  /// This method MUST be called before any other CacheHelper methods are used.
  /// It's recommended to call this in your `main.dart` file.
  static Future<void> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  /// Checks if SharedPreferences has been initialized.
  static bool get _isInitialized => _sharedPreferences != null;

  /// Asserts that SharedPreferences has been initialized.
  /// Throws a [StateError] if not initialized.
  static void _assertInitialized() {
    if (!_isInitialized) {
      throw StateError(
        'CacheHelper has not been initialized. Please call CacheHelper.init() '
        'in your main.dart file before using any cache methods.',
      );
    }
  }
  // --- Typed Save Methods ---

  /// Saves a String value to SharedPreferences.
  /// Returns `true` if successful, `false` otherwise.
  static Future<bool> saveString(String key, String value) async {
    _assertInitialized();
    return await _sharedPreferences!.setString(key, value);
  }

  /// Saves a boolean value to SharedPreferences.
  /// Returns `true` if successful, `false` otherwise.
  static Future<bool> saveBool(String key, bool value) async {
    _assertInitialized();
    return await _sharedPreferences!.setBool(key, value);
  }

  // --- Typed Get Methods ---

  /// Retrieves a String value from SharedPreferences.
  /// Returns the String value, or `null` if the key is not found or type doesn't match.
  static String? getString(String key) {
    _assertInitialized();
    return _sharedPreferences!.getString(key);
  }

  /// Retrieves a boolean value from SharedPreferences.
  /// Returns the boolean value. If the key is not found or not a boolean,
  /// it defaults to `false` (as per `SharedPreferences.getBool` behavior)
  /// or you can provide a `defaultValue`.
  static bool getBool(String key, {bool defaultValue = false}) {
    _assertInitialized();
    return _sharedPreferences!.getBool(key) ?? defaultValue;
  }
}

/// It's a good practice to define your SharedPreferences keys as constants
/// to avoid typos and manage them centrally.
class CacheKeys {
  static const String resultType = 'resultType';
  static const String isDarkMode = 'appTheme'; // e.g., "light", "dark",
  static const String onboardingCompleted = 'onboardingCompleted';
}

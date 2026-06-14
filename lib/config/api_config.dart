class ApiConfig {
  // Use your computer's local network IP if testing on a physical device,
  // or 10.0.2.2 for Android emulator (maps to host machine's localhost)
  static const String baseUrl = "http://10.0.2.2:5000";

  // Deep link scheme used for OAuth redirect back into the app
  static const String redirectScheme = "inlithanlab";
  static const String redirectHost = "auth-callback";
}

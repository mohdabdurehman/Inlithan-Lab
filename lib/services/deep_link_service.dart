import 'dart:async';
import 'package:app_links/app_links.dart';

class DeepLinkService {
  static final AppLinks _appLinks = AppLinks();
  static StreamSubscription? _sub;

  /// Call this once at app startup. [onToken] fires whenever
  /// a callback URI with a token is received.
  static void init(void Function(String token) onToken) {
    // handle link that opened the app (cold start)
    _appLinks.getInitialAppLink().then((uri) {
      if (uri != null) _handleUri(uri, onToken);
    });

    // handle links while app is running
    _sub = _appLinks.uriLinkStream.listen((uri) {
      _handleUri(uri, onToken);
    });
  }

  static void _handleUri(Uri uri, void Function(String token) onToken) {
    if (uri.scheme == 'inlithanlab' && uri.host == 'auth-callback') {
      final token = uri.queryParameters['token'];
      if (token != null) onToken(token);
    }
  }

  static void dispose() {
    _sub?.cancel();
  }
}

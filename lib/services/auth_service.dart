import 'package:url_launcher/url_launcher.dart';
import '../config/api_config.dart';

class AuthService {
  static Future<void> loginWithGithub() async {
    final url = Uri.parse('${ApiConfig.baseUrl}/auth/github?platform=mobile');
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch GitHub login');
    }
  }

  static Future<void> loginWithGoogle() async {
    final url = Uri.parse('${ApiConfig.baseUrl}/auth/google?platform=mobile');
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch Google login');
    }
  }
}

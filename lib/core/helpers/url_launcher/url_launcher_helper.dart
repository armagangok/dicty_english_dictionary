import 'package:url_launcher/url_launcher.dart';

class UrlLauncherHelper {
  UrlLauncherHelper._();

  static final shared = UrlLauncherHelper._();

  // Future<void> sendEmail(
  //     {required String mail, required String subject, String? body}) async {
  //   var uri = Uri(
  //       scheme: "mailto",
  //       path: mail,
  //       queryParameters: {"subject": subject, "body": body});

  //   await launchUrl(uri.toString());
  // }

  // Future<void> sendContactEmail(
  //     {required String mail,
  //     required String subject,
  //     required String body}) async {
  //   var uri = Uri(
  //     scheme: "mailto",
  //     path: mail,
  //     query: "subject=$subject&body=$body",
  //   );

  //   await launchUrl(uri.toString());
  //   await launch(uri.toString());
  // }

  Future<void> openUrl(String url) async {
    await launchUrl(Uri.parse(url));
  }
}

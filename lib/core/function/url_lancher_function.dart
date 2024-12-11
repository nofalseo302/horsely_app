import 'package:url_launcher/url_launcher.dart';

Future<void> _launchEmail(String email) async {
  final Uri emailUri = Uri(
    scheme: 'mailto',
    path: email,
  );
  if (await canLaunch(emailUri.toString())) {
    await launch(emailUri.toString());
  } else {
    throw 'Could not open email client';
  }
}

// Function to launch the phone dialer
Future<void> _launchPhone(String phoneNumber) async {
  final Uri phoneUri = Uri(
    scheme: 'tel',
    path: phoneNumber,
  );
  if (await canLaunch(phoneUri.toString())) {
    await launch(phoneUri.toString());
  } else {
    throw 'Could not open phone dialer';
  }
}

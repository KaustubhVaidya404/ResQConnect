import 'package:url_launcher/url_launcher.dart';

makeCall() async {
  var url = Uri.parse('tel:8080223251');
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    throw 'Could not launch $url';
  }
}

import 'package:res_q_connect/data/ambulancedata.dart';
import 'package:url_launcher/url_launcher.dart';

makeCall(String country) async {
  var countryKey = emergencyAmbulanceNumbers.entries.firstWhere(
      (element) => element.key == country,
      orElse: () => const MapEntry<String, String>("null", "null"));
  var url = Uri.parse('tel:${countryKey.value}');
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    throw 'Could not launch $url';
  }
}

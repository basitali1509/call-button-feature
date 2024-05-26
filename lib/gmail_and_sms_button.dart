import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class GmailAndSmsButton extends StatefulWidget {
  const GmailAndSmsButton({Key? key}) : super(key: key);

  @override
  State<GmailAndSmsButton> createState() => _GmailAndSmsButtonState();
}

class _GmailAndSmsButtonState extends State<GmailAndSmsButton> {
  void _launchGmail() async {
    const emailAddress = 'info@dailytelinc.com';
    final Uri emailLaunchUri = Uri(scheme: 'mailto', path: emailAddress);

    try {
      if (await canLaunchUrl(emailLaunchUri)) {
        await launchUrl(emailLaunchUri);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Error: Could not launch Gmail.'),
          ),
        );
      }
    } catch (e) {
      print("Error: $e");
    }
  }

  void _launchSMS() async {
    const phoneNumber = '888-303-5644';
    final Uri emailLaunchUri = Uri(scheme: 'sms', path: phoneNumber);

    try {
      if (await canLaunchUrl(emailLaunchUri)) {
        await launchUrl(emailLaunchUri);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Error: Could not launch SMS.'),
          ),
        );
      }
    } catch (e) {
      print("Error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: IconButton(
              onPressed: _launchSMS,
              icon: const FaIcon(
                FontAwesomeIcons.commentSms,
                size: 70,
                color: Colors.blue,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Center(
              child: IconButton(
            onPressed: _launchGmail,
            icon: const FaIcon(
              FontAwesomeIcons.google,
              size: 70,
              color: Colors.red,
            ),
          ))
        ],
      ),
    );
  }
}

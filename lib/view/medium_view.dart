import 'package:flutter/material.dart';
import 'package:responsiveness/data.dart';
import 'package:responsiveness/widgets/email_list.dart';
import 'package:responsiveness/widgets/widgets.dart';
import '../models/email.dart';

class MediumView extends StatefulWidget {
  MediumView({Key? key}) : super(key: key);

  @override
  State<MediumView> createState() => _MediumViewState();
}

class _MediumViewState extends State<MediumView> {
  bool isEmailFocused = false;
  bool isFavourite = false;
  Email selectedEmail = emails[0];
  @override
  Widget build(BuildContext context) {
    double fullWidth = MediaQuery.of(context).size.width;
    double halfWidth = fullWidth / 2;
    double oneThirdWidth = fullWidth / 3;
    double noWidth = 0.0;

    emailDetailsFocus(Email email) {
      setState(() {
        if (selectedEmail == email || !isEmailFocused) {
          isEmailFocused = !isEmailFocused;
        }
        selectedEmail = email;
      });
    }

    setFavourite() {
      setState(() {
        isFavourite = !isFavourite;
      });
    }

    return Scaffold(
      body: Builder(builder: (context) {
        return Row(
          children: [
            SizedBox(
                width: isEmailFocused ? halfWidth : fullWidth,
                child: EmailList(
                  emailDetailsFocus: emailDetailsFocus,
                  emails: emails,
                  isFavourite: isFavourite,
                  length: emails.length,
                  setFavourite: setFavourite,
                )),
            const VerticalDivider(width: 0),
            Container(
                width: isEmailFocused ? halfWidth : noWidth,
                color: Colors.white,
                child: isEmailFocused
                    ? EmailDetails(email: selectedEmail)
                    : Container())
          ],
        );
      }),
    );
  }
}
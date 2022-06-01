import 'package:flutter/material.dart';
import 'package:responsiveness/data.dart';
import 'package:responsiveness/widgets/widgets.dart';
import '../models/email.dart';

class BigView extends StatefulWidget {
  const BigView({Key? key}) : super(key: key);

  @override
  State<BigView> createState() => _BigViewState();
}

class _BigViewState extends State<BigView> {
  bool isEmailFocused = false;
  bool isFavourite = false;
  Email selectedEmail = emails[0];
  @override
  Widget build(BuildContext context) {
    double fullWidth = MediaQuery.of(context).size.width;
    double halfWidth = fullWidth / 2;
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
      backgroundColor: Colors.lightBlueAccent,
      body: Builder(builder: (context) {
        return Row(
          children: [
            SizedBox(
              width: isEmailFocused ? halfWidth : fullWidth,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                  itemCount: emails.length,
                  itemBuilder: (context, index) {
                    final email = emails[index];
                    return InkWell(
                      onTap: () {
                        emailDetailsFocus(email);
                        // Navigator.of(context).push(
                        //   MaterialPageRoute(
                        //     builder: (context) => EmailDetails(email: email),
                        //   ),
                        // );
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Row(
                          children: [
                            SenderAvatar(sender: email.sender),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: EmailPreview(email: email),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                EmailDeliveryInfo(email: email),
                                IconButton(
                                  onPressed: () {
                                    setFavourite();
                                  },
                                  icon: !isFavourite
                                      ? const Icon(Icons.star_border)
                                      : const Icon(Icons.star),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
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

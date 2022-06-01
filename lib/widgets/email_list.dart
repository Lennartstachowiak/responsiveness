import 'package:flutter/material.dart';
import 'package:responsiveness/widgets/widgets.dart';
import '../models/email.dart';

class Props {
  Props(
      {required this.emails,
      required this.emailDetailsFocus,
      required this.length,
      required this.setFavourite,
      required this.isFavourite});
  List<Email> emails;
  Function emailDetailsFocus;
  int length;
  Function setFavourite;
  bool isFavourite;
}

class EmailList extends StatelessWidget {
  const EmailList(
      {Key? key,
      required this.emails,
      required this.emailDetailsFocus,
      required this.length,
      required this.setFavourite,
      required this.isFavourite})
      : super(key: key);

  final List<Email> emails;
  final Function emailDetailsFocus;
  final int length;
  final Function setFavourite;
  final bool isFavourite;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        controller: ScrollController(),
        itemCount: length,
        itemBuilder: (context, index) {
          final email = emails[index];
          return InkWell(
            onTap: () {
              emailDetailsFocus(email);
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
    );
  }
}

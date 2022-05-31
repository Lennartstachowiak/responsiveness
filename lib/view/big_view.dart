import 'package:flutter/material.dart';
import 'package:responsiveness/data.dart';
import 'package:responsiveness/widgets/widgets.dart';

class BigView extends StatelessWidget {
  const BigView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: Builder(builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
            itemCount: emails.length,
            itemBuilder: (context, index) {
              final email = emails[index];
              return InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => EmailDetails(email: email),
                    ),
                  );
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
                            onPressed: () {},
                            icon: const Icon(Icons.star_border),
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
      }),
    );
  }
}

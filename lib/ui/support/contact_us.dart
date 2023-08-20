import 'package:flutter/material.dart';

class ContactUsPage extends StatelessWidget {
  const ContactUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Us'),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              'assets/img/applycamp_logo.png',
              width: 100,
              height: 100,
            ),
            Text(
              'Apply Camp Education Consultancy',
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: Theme.of(context).colorScheme.primary),
            ),
            SizedBox(height: 18),
            Text(
              'Apply Camp dkkmdmvk mksmdvkmsldkmslkm  dslkvmslkdmvl kalekfmk dklvms kdvkmdsv sdsdvsdv.',
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: const EdgeInsets.all(36),
              child: Column(
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.mail,
                        size: 35,
                      ),
                      SizedBox(width: 14),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Email',
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                          Text('info@applycamp.com'),
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 36),
                  Row(
                    children: [
                      Icon(
                        Icons.directions,
                        size: 35,
                      ),
                      SizedBox(width: 14),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Main Office',
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                          Text('info@applycamp.com'),
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 36),
                  Row(
                    children: [
                      Icon(
                        Icons.phone_android,
                        size: 35,
                      ),
                      SizedBox(width: 14),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Phone',
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                          Text('+90 958741256'),
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 36),
                  Row(
                    children: [
                      Icon(
                        Icons.phone_android,
                        size: 35,
                      ),
                      SizedBox(width: 14),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Support',
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                          Text('+90 879654875'),
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 36),
                  Row(
                    children: [
                      Icon(
                        Icons.mail,
                        size: 35,
                      ),
                      SizedBox(width: 14),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Instagram',
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                          Text('info@applycamp.com'),
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 36),
                  Row(
                    children: [
                      Icon(
                        Icons.mail,
                        size: 35,
                      ),
                      SizedBox(width: 14),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Facebook',
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                          Text('info@applycamp.com'),
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 36),
                  Row(
                    children: [
                      Icon(
                        Icons.mail,
                        size: 35,
                      ),
                      SizedBox(width: 14),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Twitter',
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                          Text('info@applycamp.com'),
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 36),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

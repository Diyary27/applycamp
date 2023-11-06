import 'package:flutter/material.dart';

class ContactUsPage extends StatelessWidget {
  const ContactUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Us'),
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
            const SizedBox(height: 18),
            const Text(
              'Apply Camp dkkmdmvk mksmdvkmsldkmslkm  dslkvmslkdmvl kalekfmk dklvms kdvkmdsv sdsdvsdv.',
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: const EdgeInsets.all(36),
              child: Column(
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.mail,
                        size: 35,
                      ),
                      const SizedBox(width: 14),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Email',
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                          const Text('info@applycamp.com'),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 36),
                  Row(
                    children: [
                      const Icon(
                        Icons.directions,
                        size: 35,
                      ),
                      const SizedBox(width: 14),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Main Office',
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                          const Text('info@applycamp.com'),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 36),
                  Row(
                    children: [
                      const Icon(
                        Icons.phone_android,
                        size: 35,
                      ),
                      const SizedBox(width: 14),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Phone',
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                          const Text('+90 958741256'),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 36),
                  Row(
                    children: [
                      const Icon(
                        Icons.phone_android,
                        size: 35,
                      ),
                      const SizedBox(width: 14),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Support',
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                          const Text('+90 879654875'),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 36),
                  Row(
                    children: [
                      const Icon(
                        Icons.mail,
                        size: 35,
                      ),
                      const SizedBox(width: 14),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Instagram',
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                          const Text('info@applycamp.com'),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 36),
                  Row(
                    children: [
                      const Icon(
                        Icons.mail,
                        size: 35,
                      ),
                      const SizedBox(width: 14),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Facebook',
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                          const Text('info@applycamp.com'),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 36),
                  Row(
                    children: [
                      const Icon(
                        Icons.mail,
                        size: 35,
                      ),
                      const SizedBox(width: 14),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Twitter',
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                          const Text('info@applycamp.com'),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 36),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class BannerSlider extends StatelessWidget {
  final PageController _sliderController = PageController();

  BannerSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 5 / 2,
      child: PageView.builder(
        itemCount: 2,
        controller: _sliderController,
        itemBuilder: (context, index) {
          return Stack(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Image.asset(
                  "assets/img/slide_${index + 1}.jpg",
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                bottom: 10,
                left: 0,
                right: 0,
                child: Center(
                  child: Text(
                    'Study in Turkey with ApplyCamp',
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .apply(color: Colors.white),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

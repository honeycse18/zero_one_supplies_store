import 'package:ecomikstoreapp/controller/image_zoom_screen_controller.dart';
import 'package:ecomikstoreapp/utils/constants/app_images.dart';
import 'package:ecomikstoreapp/utils/helpers/helpers.dart';
import 'package:ecomikstoreapp/widgets/core_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ImageZoomScreen extends StatelessWidget {
  const ImageZoomScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = Helper.getScreenSize(context);
    return GetBuilder<ImageZoomScreenController>(
        init: ImageZoomScreenController(),
        builder: (controller) => DecoratedBox(
              decoration: BoxDecoration(
                  color: Colors.white,
                  image: DecorationImage(
                      image:
                          Image.asset(AppAssetImages.backgroundFullPng).image,
                      fit: BoxFit.fill)),
              child: Scaffold(
                body: SizedBox(
                  height: screenSize.height,
                  width: screenSize.width,
                  child: InteractiveViewer(
                      maxScale: 4,
                      child: Image.network(
                        controller.imageURL,
                        fit: BoxFit.contain,
                        loadingBuilder: (context, child, loadingProgress) =>
                            loadingProgress == null
                                ? child
                                : const LoadingImagePlaceholderWidget(),
                        frameBuilder: (context, child, frame,
                                wasSynchronouslyLoaded) =>
                            wasSynchronouslyLoaded
                                ? child
                                : AnimatedOpacity(
                                    opacity: frame == null ? 0 : 1,
                                    duration: const Duration(milliseconds: 200),
                                    curve: Curves.easeOut,
                                    child: child,
                                  ),
                        errorBuilder: (context, error, stackTrace) =>
                            const ErrorLoadedIconWidget(isLargeIcon: true),
                      )),
                ),
              ),
            ));
  }
}

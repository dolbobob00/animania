import 'package:animania/src/data/models/banner_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../buttons/custom_button.dart';

class CustomBanner extends StatelessWidget {
  const CustomBanner({super.key, required this.banner});
  //! In future use cubit banner to get data from API
  final BannerModel banner;
  @override
  Widget build(BuildContext context) {
    final themeof = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Stack(
        children: [
          Image.asset(
            banner.imageUrl,
            width: MediaQuery.sizeOf(context).width,
            fit: BoxFit.cover,
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    banner.title ?? '',
                    style: themeof.textTheme.titleMedium!.copyWith(
                      fontSize: 20,
                      height: 0.9,
                      color: themeof.colorScheme.background,
                    ),
                  ),
                  Divider(
                    endIndent: MediaQuery.sizeOf(context).width * 0.6,
                    thickness: 2,
                  ),
                  Text(
                    banner.subtitle ?? '',
                    style: themeof.textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: CustomButton(
                      onPressed: () {
                        try {
                          context.pushNamed(
                            banner.link,
                          );
                        } catch (e) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Error caught, sorry..',
                              ),
                            ),
                          );
                        }
                      },
                      height: 25,
                      text: 'Order Now',
                      prefix: Icon(Icons.shopping_cart),
                      width: MediaQuery.sizeOf(context).width * 0.4,
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

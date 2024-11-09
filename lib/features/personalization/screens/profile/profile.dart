import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/common/widgets/images/t_circular_image.dart';
import 'package:t_store/common/widgets/texts/section_heading.dart';
import 'package:t_store/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(showBackArrow: true, title: Text('Profile')),

      /// -- Body
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(children: [
            /// Profile Picture
            SizedBox(
              width: double.infinity,
              child: Column(
                children: [
                  TCircularImage(image: TImages.user, width: 80, height: 80),
                  TextButton(
                      onPressed: () {}, child: Text('Change Profile Picture'))
                ],
              ),
            ),

            /// Details
            SizedBox(height: TSizes.spaceBtwItems / 2),
            const Divider(),
            SizedBox(height: TSizes.spaceBtwItems),

            /// Heading Profile Info
            TSectionHeading(
                title: 'Profile Information', showActionButton: false),
            SizedBox(height: TSizes.spaceBtwItems),

            TProfileMenu(
                title: 'Name', value: 'Coding with DR', onPressed: () {}),
            TProfileMenu(
                title: 'Username',
                value: 'Coding with DR SUCCESS',
                onPressed: () {}),

            SizedBox(height: TSizes.spaceBtwItems),
            const Divider(),
            SizedBox(height: TSizes.spaceBtwItems),

            /// Heading Personal Info
            const TSectionHeading(
                title: 'Personal Information', showActionButton: false),
            const SizedBox(height: TSizes.spaceBtwItems),

            TProfileMenu(
                title: 'User ID',
                value: '45689',
                icon: Iconsax.copy,
                onPressed: () {}),
            TProfileMenu(
                title: 'E-mail', value: 'coding_with_Dr', onPressed: () {}),
            TProfileMenu(
                title: 'Phone Number',
                value: '+234 805 809 4796',
                onPressed: () {}),
            TProfileMenu(title: 'Gender', value: 'Male', onPressed: () {}),
            TProfileMenu(
                title: 'Date of Birth',
                value: '8 June, 1990',
                onPressed: () {}),
            const Divider(),
            const SizedBox(height: TSizes.spaceBtwItems),

            Center(
              child: TextButton(
                  onPressed: () {},
                  child: const Text('Close Account',
                      style: TextStyle(color: Colors.red))),
            )
          ]),
        ),
      ),
    );
  }
}

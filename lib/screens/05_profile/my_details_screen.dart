import 'package:flutter/material.dart';
import 'package:mcontact/resources/images.dart';
import 'package:mcontact/resources/strings.dart';
import 'package:mcontact/themes/colors.dart';
import 'package:mcontact/widget/common/black_space_widget.dart';
import 'package:mcontact/widget/common/button.dart';
import 'package:mcontact/widget/common/text_field.dart';

class MyDetailsScreen extends StatefulWidget {
  const MyDetailsScreen({super.key});

  @override
  State<MyDetailsScreen> createState() => _MyDetailsScreenState();
}

class _MyDetailsScreenState extends State<MyDetailsScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController companyController = TextEditingController();
  TextEditingController websiteController = TextEditingController();
  TextEditingController designationController = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      floatHeaderSlivers: false,
      headerSliverBuilder: (context, innerBoxIsScrolled) => [
        SliverAppBar(
          snap: true,
          floating: true,
          pinned: true,
          centerTitle: true,
          expandedHeight: 150,
          actions: const [
            // Image.asset(
            //   Images.logo,
            //   width: 100,
            // ),
          ],
          title: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text('data'),
            ],
          ),
          bottom: PreferredSize(
            preferredSize: const Size(double.infinity, 50),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Text(
                'My Details',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: AppColors.white,
                    ),
              ),
            ),
          ),
        )
      ],
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Column(
            children: [
//Email
              PrimaryTextFormField(
                controller: emailController,
                hintText: Strings.enterEmail,
                floatingHintText: Strings.email,
              ),

//Name
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 22),
                child: PrimaryTextFormField(
                  controller: nameController,
                  hintText: Strings.enterFullName,
                  floatingHintText: Strings.name,
                ),
              ),

// Company name
              PrimaryTextFormField(
                controller: companyController,
                hintText: Strings.enterCompanyName,
                floatingHintText: Strings.companyName,
              ),

// Website
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 22),
                child: PrimaryTextFormField(
                  controller: websiteController,
                  hintText: Strings.enterWebsite,
                  floatingHintText: Strings.website,
                ),
              ),

// Designation
              PrimaryTextFormField(
                controller: designationController,
                hintText: Strings.enterDesignationPosition,
                floatingHintText: Strings.designation,
              ),

// Mobile number
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 22),
                child: PrimaryTextFormField(
                  controller: mobileNumberController,
                  hintText: Strings.enterMobileNumber,
                  floatingHintText: Strings.mobileNumber,
                ),
              ),

// Address
              PrimaryTextFormField(
                controller: addressController,
                hintText: Strings.enterAddress,
                floatingHintText: Strings.address,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 22),
                child: Row(
                  children: [
                    Expanded(
                      child: PrimaryButton(
                        onTap: () {},
                        title: Strings.uploadProfilePicture,
                        bgColor: AppColors.green5b,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: PrimaryButton(
                      onTap: () {},
                      isEnable: false,
                      title: Strings.submit,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mcontact/bloc/contact/contact_bloc.dart';
import 'package:mcontact/core/model/contact_details_list_temp.dart';
import 'package:mcontact/resources/images.dart';
import 'package:mcontact/resources/strings.dart';
import 'package:mcontact/themes/colors.dart';
import 'package:mcontact/utils/navigation.dart';
import 'package:mcontact/utils/regx.dart';
import 'package:mcontact/utils/utils.dart';
import 'package:mcontact/widget/common/button.dart';
import 'package:mcontact/widget/common/sliver_app_bar.dart';
import 'package:mcontact/widget/common/text_field.dart';
import 'package:mcontact/widget/toast/toast.dart';

class ProfileAddOrUpdateScreen extends StatefulWidget {
  const ProfileAddOrUpdateScreen({super.key});

  @override
  State<ProfileAddOrUpdateScreen> createState() =>
      _ProfileAddOrUpdateScreenState();
}

class _ProfileAddOrUpdateScreenState extends State<ProfileAddOrUpdateScreen> {
  @override
  void initState() {
    super.initState();
    contactBloc = BlocProvider.of<ContactBloc>(context, listen: false);

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      fetchData();
    });
  }

  var args = {};

  bool isEnabileSubmit = false;

  late ContactBloc contactBloc;

  String imagePath = '';

  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController companyController = TextEditingController();
  TextEditingController websiteController = TextEditingController();
  TextEditingController designationController = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  FocusNode nameFocus = FocusNode();
  FocusNode emailFocus = FocusNode();
  FocusNode companyFocus = FocusNode();
  FocusNode websiteFocus = FocusNode();
  FocusNode designationFocus = FocusNode();
  FocusNode mobileFocus = FocusNode();
  FocusNode addressFocus = FocusNode();

  GlobalKey formKey = GlobalKey();

  Person? person;

  ScrollController scrollController = ScrollController();

  void fetchData() {
    if (ModalRoute.of(context)!.settings.arguments != null) {
      args = ModalRoute.of(context)!.settings.arguments as Map;
      if (args["id"] != null) {
        var contactListResponseModel = contactBloc.contactListResponseModel!;
        for (int i = 0; i < contactListResponseModel.persons.length; i++) {
          if (int.parse(args["id"].toString()) ==
              contactListResponseModel.persons[i].id) {
            person = contactListResponseModel.persons[i];
            initTextEditController(person!);
          }
        }
      }
      if (args["is_qr"] != null && args["is_qr"]) {
        var person = args["person"] as Person;
        initTextEditController(person);
      }
    }
  }

  void initTextEditController(Person person) {
    nameController.text = person.name;
    emailController.text = person.email;
    companyController.text = person.companyName;
    websiteController.text = person.website;
    designationController.text = person.designation;
    mobileNumberController.text = person.phoneNumber;
    addressController.text = person.address;
    setState(() {});
  }

  bool emailValidator(String email) =>
      RegExp(Regx.emailValidate).hasMatch(email);

  bool setSumbitButton() {
    if (nameController.text.isNotEmpty &&
        emailController.text.isNotEmpty &&
        addressController.text.isNotEmpty &&
        companyController.text.isNotEmpty &&
        designationController.text.isNotEmpty &&
        websiteController.text.isNotEmpty &&
        mobileNumberController.text.isNotEmpty) {
      isEnabileSubmit = true;
      setState(() {});

      return true;
    } else {
      isEnabileSubmit = false;
      setState(() {});

      return false;
    }
  }

  void onChanged(String value) {}

  submitOntap() {
    if (emailController.text.isEmpty) {
      emailFocus.requestFocus();
    } else if (nameController.text.isEmpty) {
      nameFocus.requestFocus();
    } else if (companyController.text.isEmpty) {
      companyFocus.requestFocus();
    } else if (websiteController.text.isEmpty) {
      websiteFocus.requestFocus();
    } else if (designationController.text.isEmpty) {
      designationFocus.requestFocus();
    } else if (mobileNumberController.text.isEmpty) {
      mobileFocus.requestFocus();
    } else if (addressController.text.isEmpty) {
      addressFocus.requestFocus();
    } else if (emailValidator(emailController.text)) {
      isEnabileSubmit = true;
      setState(() {});
    } else {
      isEnabileSubmit = false;
      setState(() {});

      emailFocus.requestFocus();
      showToast(Strings.pleaseEnterAValidEmail);
    }
    if (isEnabileSubmit) {
      if (args['id'] != null) {
        updateContact();
      } else {
        addContact();
      }
    }
  }

  Future<void> addContact() async {
    contactBloc.add(
      AddContactEvent(
        emailController.text,
        nameController.text,
        companyController.text,
        websiteController.text,
        designationController.text,
        mobileNumberController.text,
        addressController.text,
        imagePath,
      ),
    );
  }

  Future<void> updateContact() async {
    contactBloc.add(
      UpdateContactEvent(
          int.parse(args["id"].toString()),
          emailController.text,
          nameController.text,
          companyController.text,
          websiteController.text,
          designationController.text,
          mobileNumberController.text,
          addressController.text,
          imagePath),
    );
  }

  void onTapUploadProfilePicture() async {
    final ImagePicker imagePicker = ImagePicker();
    XFile? imageList = await imagePicker.pickImage(source: ImageSource.gallery);
    if (imageList != null) {
      var image = await Utils.cropImage(imageList.path);
      if (image != null) {
        imagePath = image.path;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer(
      bloc: contactBloc,
      listener: (context, state) {
        if (state is UpdateContactState) {
          contactBloc.add(ContactListEvent());
        }
        if (state is AddContactState) {
          contactBloc.add(ContactListEvent());
        }
        if (state is ContactListState) {
          if (args["id"] == null) {
            showToast(Strings.added);
          } else {
            showToast(Strings.updated);
          }

          Navigation.pop(context);
        }
      },
      builder: (context, state) {
        return NestedScrollView(
          floatHeaderSlivers: false,
          controller: scrollController,
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            CommonSliverAppBar(
              scrollController: scrollController,
              name: nameController.text,
              imagePath: Images.logo,
              title: Strings.myDetails,
            )
          ],
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: Column(
                children: [
                  //Email
                  Form(
                    key: formKey,
                    onChanged: () {
                      setSumbitButton();
                    },
                    child: Column(
                      children: [
                        PrimaryTextFormField(
                          controller: emailController,
                          hintText: Strings.enterEmail,
                          floatingHintText: Strings.email,
                          onChang: onChanged,
                          focusNode: emailFocus,
                        ),

                        //Name
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 22),
                          child: PrimaryTextFormField(
                            controller: nameController,
                            hintText: Strings.enterFullName,
                            floatingHintText: Strings.name,
                            focusNode: nameFocus,
                          ),
                        ),

                        // Company name
                        PrimaryTextFormField(
                          controller: companyController,
                          hintText: Strings.enterCompanyName,
                          floatingHintText: Strings.companyName,
                          focusNode: companyFocus,
                        ),

                        // Website
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 22),
                          child: PrimaryTextFormField(
                            controller: websiteController,
                            hintText: Strings.enterWebsite,
                            floatingHintText: Strings.website,
                            keyboardType: TextInputType.url,
                            focusNode: websiteFocus,
                          ),
                        ),

                        // Designation
                        PrimaryTextFormField(
                          controller: designationController,
                          hintText: Strings.enterDesignationPosition,
                          floatingHintText: Strings.designation,
                          focusNode: designationFocus,
                        ),

                        // Mobile number
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 22),
                          child: PrimaryTextFormField(
                            controller: mobileNumberController,
                            hintText: Strings.enterMobileNumber,
                            floatingHintText: Strings.mobileNumber,
                            keyboardType: TextInputType.number,
                            focusNode: mobileFocus,
                          ),
                        ),

                        // Address
                        PrimaryTextFormField(
                          controller: addressController,
                          hintText: Strings.enterAddress,
                          floatingHintText: Strings.address,
                          keyboardType: TextInputType.streetAddress,
                          focusNode: addressFocus,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 22),
                    child: Row(
                      children: [
                        Expanded(
                          child: PrimaryButton(
                            onTap: onTapUploadProfilePicture,
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
                          onTap: submitOntap,
                          isEnable: isEnabileSubmit,
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
      },
    );
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';

import '../../../config/app_colors.dart';
import '../../../config/app_text_style.dart';
import '../../../gen/assets.gen.dart';
import '../../../generated/l10n.dart';
import '../../../utils/route/app_routing.dart';
import '../../common/method/common_button.dart';
import '../../common/method/common_text_form_field.dart';
import '../../common/method/sized_box_10h.dart';
import '../../common/widget/header_curved_container.dart';
import '../../common/widget/loading_widget.dart';
import '../bloc/account_bloc.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  late final _user = FirebaseAuth.instance.currentUser;

  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();

  final _emailController = TextEditingController();

  final picker = ImagePicker();

  // Future<String> chooseImage() async {
  //   final XFile pickedFile = (await picker.pickImage(source: ImageSource.gallery))!;
  //
  //   return pickedFile.path;
  // }

  late final XFile pickedFile;

  User? user;

  onRefresh(userCred) {
    setState(() {
      user = userCred;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    onRefresh(FirebaseAuth.instance.currentUser);
  }

  @override
  Widget build(context) => Scaffold(
        body: BlocBuilder<AccountBloc, AccountState>(
          builder: (bContext, state) {
            if (state is AccountLoadingState) {
              return Center(
                child: loading(),
              );
            } else if (state is AccountLoadedState) {
              if (user != null && user!.emailVerified) {
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      CustomPaint(
                        child: SizedBox(
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height / 12.h,
                        ),
                        painter: HeaderCurvedContainer(
                          customColor: AppColors.kPrimaryColor,
                        ),
                      ),
                      CircleAvatar(
                        radius: 100.r,
                        backgroundImage: NetworkImage(
                          _user!.photoURL.toString(),
                        ),
                        child: Container(
                          height: 150.h,
                          alignment: Alignment.bottomRight,
                          child: CircleAvatar(
                            radius: 23.r,
                            backgroundColor: AppColors.kBlack54,
                            child: IconButton(
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (context) => Form(
                                    key: _formKey,
                                    child: AlertDialog(
                                      elevation: 16,
                                      content: SingleChildScrollView(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Avatar(
                                              onTap: () {
                                                showModalBottomSheet(
                                                  context: context,
                                                  builder: (builder) => Wrap(
                                                    children: [
                                                      ListTile(
                                                        leading: Icon(Icons.image,
                                                            color:
                                                            AppColors.kPrimaryColor),
                                                        title: const Text(
                                                          'Gallery',
                                                        ),
                                                        onTap: () async {
                                                          pickedFile =
                                                          (await picker.pickImage(
                                                              source: ImageSource
                                                                  .gallery))!;

                                                          Navigator.of(context).pop();
                                                        },
                                                      ),
                                                      ListTile(
                                                        leading: Icon(
                                                          Icons.camera_alt,
                                                          color: AppColors.kPrimaryColor,
                                                        ),
                                                        title: const Text('Camera'),
                                                        onTap: () async {
                                                          pickedFile =
                                                          (await picker.pickImage(
                                                              source: ImageSource
                                                                  .camera))!;

                                                          Navigator.of(context).pop();
                                                        },
                                                      )
                                                    ],
                                                  ),
                                                );
                                              },

                                              ///avatarUrl: pickedFile.path,
                                            ),
                                            sizedBox10h(),
                                            Text(
                                              S.current.changeProfile,
                                              style: AppTextStyle.fontSize20.copyWith(
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            sizedBox10h(),
                                            commonTextFormField(
                                              controller: _nameController,
                                              labelText: S.current.userName,
                                              validator: (value) {
                                                if (value != null && value.isNotEmpty) {
                                                  return null;
                                                }
                                                return S.current.cannotEmpty;
                                              },
                                              prefixIcon: const Icon(
                                                Icons.person,
                                              ),
                                              autovalidateMode:
                                              AutovalidateMode.onUserInteraction,
                                            ),

                                            sizedBox10h(),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.end,
                                              children: [
                                                SizedBox(
                                                  width: 100.w,
                                                  child: commonTextButton(
                                                    onPressed: () {
                                                      Navigator.of(context).pop();
                                                    },
                                                    text: S.current.cancel,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 100.w,
                                                  child: commonElevatedButton(
                                                    buttonColor: AppColors.kPrimaryColor,
                                                    onPressed: () {
                                                      bContext.read<AccountBloc>().add(
                                                        AccountChangeEvent(
                                                          userName:
                                                          _nameController.text,
                                                          email:
                                                          _emailController.text,
                                                          photoURL: pickedFile,
                                                        ),
                                                      );

                                                      Navigator.of(context).pop();
                                                    },
                                                    text: S.current.ok,
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  barrierDismissible: true,
                                );
                              },
                              icon: const Icon(
                                Icons.edit,
                              ),
                              color: AppColors.kWhite,
                            ),
                          ),
                        ),
                      ),
                      sizedBox10h(),
                      Text(
                        "${S.current.hello} ${_user!.displayName}",
                        style: AppTextStyle.fontSize40.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: ListTile(
                          title: Text('${S.current.email}: ${_user!.email}'),
                          leading: const Icon(
                            Icons.email,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                        ),
                        child: SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: commonElevatedButtonIcon(
                            icon: Icons.logout,
                            buttonColor: AppColors.kPrimaryColor,
                            text: S.current.logout,
                            onPressed: () {
                              FirebaseAuth.instance.signOut();
                              Navigator.pushReplacementNamed(
                                context,
                                RouteDefine.loginSignupIndexScreen.name,
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }
              return accountNotLoginWidget(context);
            } else if (state is AccountFailureState) {
              return Center(
                child: Text(
                  'Fail: ${state.message}',
                ),
              );
            }
            return Container();
          },
        ),
      );

  accountNotLoginWidget(BuildContext context) => SingleChildScrollView(
        child: Column(
          children: [
            CustomPaint(
              child: SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 18.h,
              ),
              painter: HeaderCurvedContainer(
                customColor: AppColors.kPrimaryColor,
              ),
            ),
            Text(
              S.current.youAreNotLogin,
              textAlign: TextAlign.center,
              style: AppTextStyle.fontSize24.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            sizedBox10h(),

            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 32,
              ),
              child: commonElevatedButtonIcon(
                icon: Icons.login,
                buttonColor: AppColors.kWhite,
                text: S.current.loginNow,
                textColor: AppColors.kBlack,
                iconColor: AppColors.kBlack,
                onPressed: () {
                  Navigator.pushReplacementNamed(
                    context,
                    RouteDefine.loginSignupIndexScreen.name,
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: SvgPicture.asset(
                Assets.svgImages.notLogin.path,
              ),
            ),
          ],
        ),
      );


}

class Avatar extends StatelessWidget {
  final String? avatarUrl;
  final VoidCallback onTap;

  const Avatar({this.avatarUrl, required this.onTap});

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: onTap,
        child: Center(
          child: avatarUrl == null
              ? CircleAvatar(
                  radius: 50.0,
                  child: Icon(
                    Icons.photo_camera,
                    color: AppColors.kWhite,
                  ),
                  backgroundColor: AppColors.kPrimaryColor,
                )
              : CircleAvatar(
                  radius: 50.0,
                  backgroundImage: AssetImage(
                    avatarUrl.toString(),
                  ),
                ),
        ),
      );
}

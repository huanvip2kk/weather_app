import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../config/app_colors.dart';
import '../../../../config/app_text_style.dart';
import '../../../../generated/l10n.dart';
import '../../../../utils/route/app_routing.dart';
import '../../../Common/widget/Common_elevated_button.dart';
import '../../../Common/widget/Common_elevated_button_icon.dart';
import '../../../Common/widget/Common_text_button.dart';
import '../../../Common/widget/Common_text_form_field.dart';
import '../../../common/method/common_show_modal_bottom_sheet.dart';
import '../../../common/widget/common_custom_paint.dart';
import '../../bloc/account_bloc.dart';

class AccountLoginWidget extends StatefulWidget {
  const AccountLoginWidget({
    Key? key,
    required this.state,
    required this.context,
  }) : super(key: key);

  final AccountLoadedState state;
  final BuildContext context;

  @override
  _AccountLoginWidgetState createState() => _AccountLoginWidgetState();
}

class _AccountLoginWidgetState extends State<AccountLoginWidget> {
  late final _user = FirebaseAuth.instance;

  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();

  final picker = ImagePicker();

  late final XFile pickedFile;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const CommonCustomPaint(),
          CircleAvatar(
            radius: 100.r,
            backgroundImage: NetworkImage(
              _user.currentUser!.photoURL.toString(),
            ),
            child: Container(
              height: 150.h,
              alignment: Alignment.bottomRight,
              child: CircleAvatar(
                radius: 23.r,
                backgroundColor: AppColors.black54,
                child: IconButton(
                  onPressed: () async {
                    commonShowModalBottomSheet(
                      context: context,
                      icon1: const Icon(
                        Icons.image_outlined,
                      ),
                      icon2: const Icon(
                        Icons.camera_alt_outlined,
                      ),
                      onTap1: () async {
                        pickedFile = (await picker.pickImage(
                            source: ImageSource.gallery))!;

                        context.read<AccountBloc>().add(
                              AccountChangeUserPhotoEvent(photoURL: pickedFile),
                            );

                        Navigator.of(context).pop();
                      },
                      onTap2: () async {
                        pickedFile = (await picker.pickImage(
                            source: ImageSource.camera))!;

                        context.read<AccountBloc>().add(
                              AccountChangeUserPhotoEvent(photoURL: pickedFile),
                            );
                        Navigator.of(context).pop();
                      },
                      title1: Text(
                        S.current.gallery,
                      ),
                      title2: Text(S.current.camera),
                    );
                  },
                  icon: const Icon(
                    Icons.camera_alt,
                  ),
                  color: AppColors.white,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          ListTile(
            title: Text(
              S.current.hello(
                _user.currentUser!.displayName.toString(),
              ),
              style: AppTextStyle.fontSize40.copyWith(
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            trailing: IconButton(
              onPressed: () {
                buildChangeUserShowDialog(context);
              },
              icon: const Icon(
                Icons.edit,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                ListTile(
                  title:
                      Text('${S.current.email}: ${_user.currentUser!.email}'),
                  leading: const Icon(
                    Icons.email,
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                widget.state.usersModel.isAdmin
                    ? Column(
                        children: [
                          SizedBox(
                            width: double.infinity,
                            height: 50.h,
                            child: CommonElevatedButton(
                                text: S.current.accountManagement,
                                onPressed: () {
                                  Navigator.pushNamed(
                                    context,
                                    RouteDefine.accountListScreen.name,
                                  );
                                }),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          SizedBox(
                            width: double.infinity,
                            height: 50.h,
                            child: CommonElevatedButton(
                              text: S.current.newsManagement,
                              onPressed: () {
                                Navigator.pushNamed(
                                  context,
                                  RouteDefine.newsManagementScreen.name,
                                );
                              },
                            ),
                          ),
                        ],
                      )
                    : const SizedBox(),
                SizedBox(
                  height: 10.h,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 50.h,
                  child: CommonElevatedButton(
                      text: S.current.favoritesList,
                      onPressed: () {
                        Navigator.pushNamed(
                            context, RouteDefine.favoritesListScreen.name);
                      }),
                ),
                SizedBox(
                  height: 10.h,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 50.h,
                  child: CommonElevatedButtonIcon(
                    icon: Icons.logout,
                    buttonColor: AppColors.dangerColor,
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
              ],
            ),
          ),
        ],
      ),
    );
  }

  buildChangeUserShowDialog(BuildContext context) async {
    await showDialog(
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
                Text(
                  S.current.changeProfile,
                  style: AppTextStyle.fontSize20.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                CommonTextFormField(
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
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                      width: 100.w,
                      child: CommonTextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        text: S.current.cancel,
                      ),
                    ),
                    SizedBox(
                      width: 100.w,
                      child: CommonElevatedButton(
                        buttonColor: AppColors.primaryColor,
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            widget.context.read<AccountBloc>().add(
                                  AccountChangeUserNameEvent(
                                    userName: _nameController.text,
                                  ),
                                );
                          }

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
  }
}

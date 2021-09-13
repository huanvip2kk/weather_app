import 'package:flutter/material.dart';

import '../../../config/app_colors.dart';
import '../../../config/app_text_style.dart';
import '../../../data/utils/shared_pref_manager.dart';
import '../../../generated/l10n.dart';
import '../../../utils/route/app_routing.dart';
import '../../common/method/toast.dart';
import '../../common/widget/back_app_bar_icon_button.dart';
import '../../common/widget/common_list_tile.dart';
import '../../common/widget/common_switch_list_tile.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  late bool metric;

  List languages = ['English', 'Tiếng Việt'];

  String lang = 'English';
  String vi = 'Tiếng Việt';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    lang = sharedPrefs.lang ?? lang;
    metric = sharedPrefs.metric!;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: BackAppBarIconButton(
          onPressed: () {
            Navigator.pushReplacementNamed(
              context,
              RouteDefine.mainScreen.name,
            );
          },
        ),
        title: Text(
          S.current.setting,
          style: AppTextStyle.fontSize20.copyWith(
            color: AppColors.primaryColor,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CommonSwitchListTile(
              title: S.current.chooseUnits,
              valueTextOn: S.current.imperial,
              valueTextOff: S.current.metric,
              icon: const Icon(
                Icons.ac_unit,
              ),
              boolValue: metric,
              onChanged: (value) async {
                setState(() {
                  metric = !metric;
                });
                sharedPrefs.setBoolToSF(
                  metric: metric,
                );
              },
            ),
            CommonDropdownButton(
              title: Text(
                S.current.chooseYourLanguages,
                style: AppTextStyle.fontSize14.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              string: lang,
              listString: languages,
              leadingIcon: const Icon(Icons.language),
              onChanged: (value) async {
                if (value == vi) {
                  setState(() {
                    lang = value.toString();

                    sharedPrefs.setStringToSF(
                      lang: lang,
                    );
                  });

                  await S.load(
                    const Locale('vi', 'VN'),
                  );
                  toast(
                    msg: S.current.choosed(S.current.tiengViet),
                  );
                } else {
                  setState(() {
                    lang = value.toString();

                    sharedPrefs.setStringToSF(
                      lang: lang,
                    );
                  });

                  await S.load(
                    const Locale('en', 'EN'),
                  );

                  toast(
                    msg: S.current.choosed(S.current.english),
                  );
                }

                lang = value.toString();
              },
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:wordmind/API/models/word_api_model.dart';
import 'package:wordmind/app/components/common/buttons.dart';
import 'package:wordmind/app/components/common/textfields.dart';
import 'package:wordmind/app/controllers/text_editing_controllers.dart';
import 'package:wordmind/app/views/view_settings/settings.dart';
import 'package:wordmind/app/views/view_word_adding/view_add_word.dart';
import 'package:wordmind/database/hive_helper.dart';
import 'package:wordmind/services/fetch_word.dart';
import 'components/dialog_widget/dialog_widget.dart';
import 'components/scaffold_body_widget/look_up.dart';

late Future<WordApi> wordInfo;

class HomeView extends StatefulWidget {
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20.0,
                      vertical: 3,
                    ),
                    child: Row(
                      children: [
                        CustomIconButton(
                          icon: Icon(Icons.settings),
                          onPressed: () async => Get.to(SettingView(
                            accent: await hiveHelper.getLanguage(),
                          )),
                        ),
                        CustomIconButton(
                          icon: Icon(Icons.add_chart),
                          onPressed: () => Get.to(() => AddWordView()),
                        ),
                        Expanded(
                          child: CustomTextField(
                            icon: Icon(Icons.search),
                            onTap: () => {
                              wordInfo = fetchWord(
                                textController.searchController.text,
                              ),
                              dialogScreen(wordInfo),
                              textController.textController.clear(),
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height - 80,
                    child: LookUpScreen(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

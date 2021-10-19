import 'package:flutter/material.dart';
import 'package:wordmind/app/screens/settings_screen/settings.dart';
import 'package:wordmind/app/screens/word_adding_screen/add_word_screen.dart';
import 'package:wordmind/database/hive_helper.dart';

import 'icon_button_widget.dart';

class BottomAppBarWidget extends StatelessWidget {
  const BottomAppBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: SizedBox(
        height: 60,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButtonWidget(
                routeName: AddingPage(),
                icon: Icon(Icons.text_fields),
              ),
              const VerticalDivider(color: Colors.white),
              IconButton(
                onPressed: () async {
                  String lang = await hiveHelper.getLanguage();
                  
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Setting(
                        
                        countryLanguage: lang,
                      ),
                    ),
                  );
                },
                icon: Icon(Icons.settings),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

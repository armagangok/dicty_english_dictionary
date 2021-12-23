import 'package:english_accent_dictionary/app/views/view_home/components/scaffold_body_widget/widgets/dict_data_stack.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/api/models/word_model.dart';
import '../../../../../../core/database/hive_helper.dart';
import '../../../../../../core/database/models/word_hive_model.dart';
import '../../../../../global/components/common/buttons.dart';

class FutureBuilderWidget extends StatelessWidget {
  final Future<WordModel> wordInfo;
  const FutureBuilderWidget({
    Key? key,
    required this.wordInfo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<WordModel>(
      future: wordInfo,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Column(
            children: [
              DisctionaryDataStack(snapshot: snapshot),
              CustomElevatedButton(
                text: "save",
                buttonH: 30,
                buttonW: MediaQuery.of(context).size.height,
                onPressed: () async {
                  WordModel data = (await wordInfo);
                  Word data1 = Word(
                    word: data.word,
                    origin: data.origin,
                    meaning1: data.meaning1,
                    meaning2: data.meaning2,
                    example: data.example,
                  );
                  await hiveHelper.addData(data1);
                },
              ),
            ],
          );
        } else if (snapshot.hasError) {
          return const Text('Try again or there is no the word in dictionary.');
        }
        return SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child:const Center(
              child: CircularProgressIndicator(),
            ),
          ),
        );
        
      },
    );
  }
}

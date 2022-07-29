import 'package:flutter/material.dart';

import '../export/export.dart';

class DictionaryWidget extends StatelessWidget {
  const DictionaryWidget({
    Key? key,
    required this.definitions,
  }) : super(key: key);

  final List<Definition> definitions;

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ClampingScrollPhysics(),
      shrinkWrap: true,
      children: [
        buildDefinitions(),
        const SizedBox001(),
      ],
    );
  }

  Widget buildDefinitions() {
    return Builder(
      builder: (context) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "DEFINITIONS",
              style: context.textTheme.bodyLarge!.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            definitions.isEmpty
                ? const Text("No definition.")
                : definitionBuilder()
          ],
        );
      },
    );
  }

  Widget definitionBuilder() {
    return ListView.separated(
      separatorBuilder: (context, index) => SizedBox(
        height: context.height(0.01),
      ),
      physics: const ClampingScrollPhysics(),
      shrinkWrap: true,
      itemCount: definitions.length,
      itemBuilder: (context, index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            definitions[index].definition == null
                ? const SizedBox()
                : buildDefinitonText(index),
            definitions[index].example == null
                ? const SizedBox()
                : buildExampleText(index),
          ],
        );
      },
    );
  }

  Widget buildDefinitonText(int index) {
    return Builder(builder: (context) {
      return Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: "${index + 1}.",
              style: context.textTheme.bodyMedium!.copyWith(
                color: Colors.blue,
                fontWeight: FontWeight.w800,
              ),
            ),
            TextSpan(text: definitions[index].definition),
          ],
        ),
      );
    });
  }

  Widget buildExampleText(int index) {
    return Builder(builder: (context) {
      return Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: "Example: ",
              style: context.textTheme.bodyMedium!.copyWith(
                color: Colors.blue,
                fontWeight: FontWeight.w700,
              ),
            ),
            TextSpan(text: definitions[index].example),
          ],
        ),
      );
    });
  }
}

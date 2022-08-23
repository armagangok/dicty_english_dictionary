


import '../../global/export/export.dart';

class DictionaryWidget extends StatelessWidget {
  DictionaryWidget({
    Key? key,
    required this.definitions,
  }) : super(key: key);

  final List<Definition> definitions;

  final _listController = Injection.instance.locator.get<RecentController>();

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ClampingScrollPhysics(),
      shrinkWrap: true,
      children: [
        SizedBox(height: context.normalHeight),
        buildDefinitions(),
      ],
    );
  }

  Widget buildDefinitions() => Builder(
        builder: (context) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () => _listController.extend(),
              child: Row(
                children: [
                  Text(
                    "DEFINITIONS",
                    style: context.textTheme.labelLarge!.copyWith(
                      fontWeight: FontWeight.w900,
                      fontStyle: FontStyle.italic,
                      decoration: TextDecoration.underline,
                      color: context.colors.onSurface,
                    ),
                  ),
                ],
              ),
            ),
            definitions.isEmpty
                ? const Text("No definition.")
                : definitionBuilder()
          ],
        ),
      );

  Widget definitionBuilder() => ListView.separated(
        separatorBuilder: (context, index) =>
            SizedBox(height: context.height(0.01)),
        physics: const ClampingScrollPhysics(),
        shrinkWrap: true,
        itemCount: definitions.length,
        itemBuilder: (context, index) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            definitions[index].definition == null
                ? const SizedBox()
                : buildDefinitonText(index),
            definitions[index].example == null
                ? const SizedBox()
                : buildExampleText(index),
          ],
        ),
      );

  Widget buildDefinitonText(int index) => Builder(
        builder: (context) => Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: "${index + 1}.",
                style: context.textTheme.bodyMedium!.copyWith(
                  color: context.colors.onSurface,
                  fontWeight: FontWeight.w800,
                  fontStyle: FontStyle.italic,
                ),
              ),
              TextSpan(
                text: " " "${definitions[index].definition}",
                style: context.textTheme.bodyMedium!
                    .copyWith(color: context.primary),
              ),
            ],
          ),
        ),
      );

  Widget buildExampleText(int index) => Builder(
        builder: (context) => Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: "Example.",
                style: context.textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.w700,
                  color: context.colors.onSurface,
                  fontStyle: FontStyle.italic,
                  decoration: TextDecoration.underline,
                ),
              ),
              TextSpan(
                text: " " "${definitions[index].example}",
                style: context.textTheme.bodyMedium!
                    .copyWith(color: context.primary),
              ),
            ],
          ),
        ),
      );
}

import 'package:flutter/material.dart';

import '../../../../global/export/export.dart';

class RecentAppBar extends StatelessWidget implements PreferredSizeWidget {
  const RecentAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      title: const Text(KString.recent),
      widget: Builder(
        builder: (context) => TextButton(
          style: ButtonStyle(
            padding: MaterialStateProperty.all(EdgeInsets.zero),
          ),
          onPressed: () {
            Injection.recentCubit.edit();
          },
          child: BlocBuilder<RecentCubit, RecentState>(
            bloc: Injection.recentCubit,
            builder: (context, state) {
              return Text(
                Injection.recentCubit.isEditting ? KString.done : KString.edit,
                style: context.textTheme.bodyMedium!.copyWith(
                  color: Colors.white,
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

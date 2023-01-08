  import '../../global/export/export.dart';

LinearGradient get gradientDecoration => const LinearGradient(
        colors: [
          KColor.primaryColorBright,
          KColor.primaryColor,
        ],
        begin: FractionalOffset(0.0, 0.0),
        end: FractionalOffset(1.0, 0.0),
        stops: [0.0, 1.0],
        tileMode: TileMode.clamp,
      );
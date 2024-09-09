import '../constant/app_strings.dart';

enum FontFamily {
  BOLD(AppStrings.bold),
  MEDIAUM(AppStrings.medium),
  REGULAR(AppStrings.regular),
  LATOBOLD(AppStrings.latoBold),
  LATOREGULAR(AppStrings.latoRegular),
  LATOMEDIUM(AppStrings.latoMedium),
  LATOSEMIBOLD(AppStrings.latoSemibold),
  LATOHEAVY(AppStrings.latoHeavy);
  final String type;
  const FontFamily(this.type);
}

enum APIMethods {
  GET(AppStrings.get),
  POST(AppStrings.post);

  final String type;
  const APIMethods(this.type);
}


enum Storage {
  TOKEN(AppStrings.token),
  NAME(AppStrings.name),
  EMAIL(AppStrings.email),
  SEGMENT(AppStrings.segment);

  final String type;

  const Storage(this.type);
}

enum AppRoutesEnum {
  newsList,
  news;

  String get routeToPath {
    switch (this) {
      case AppRoutesEnum.newsList:
        return '/${AppRoutesEnum.newsList.name}';
      case AppRoutesEnum.news:
        return AppRoutesEnum.news.name;
    }
  }

  String get routeToName {
    switch (this) {
      case AppRoutesEnum.newsList:
        return '/${AppRoutesEnum.newsList.name}'.toUpperCase();
      case AppRoutesEnum.news:
        return AppRoutesEnum.news.name.toUpperCase();
    }
  }
}

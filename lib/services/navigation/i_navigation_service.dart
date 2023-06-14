abstract class INavigationServies {
  Future<dynamic> navigateTo(String routeName);
  goBack();
  Future<dynamic> navigateToArgs(String routeName, {dynamic arguments});
}

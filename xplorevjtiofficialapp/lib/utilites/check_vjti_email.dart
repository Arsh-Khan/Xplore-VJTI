import 'package:xplorevjtiofficialapp/constants/app_constants.dart';
import 'dart:developer' as devtools show log;

bool emailCheck(String email) {
  int index = email.lastIndexOf('@');
  String domainProvider = email.substring(index);
  List<String> domains = domainProvider.split('.');

  String matchedBranchCode = branchesCode
      .singleWhere((element) => element == domains[0], orElse: () => 'null');

  if (matchedBranchCode == 'null') {
    String domainName = '${domains[1]}.${domains[2]}.${domains[3]}';
    devtools.log(domainName);
    if (domainName == vjtiDomain) {
      return true;
    } else {
      return false;
    }
  } else {
    return false;
  }
}

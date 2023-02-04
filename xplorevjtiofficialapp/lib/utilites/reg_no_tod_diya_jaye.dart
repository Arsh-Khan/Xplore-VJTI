import 'package:xplorevjtiofficialapp/constants/app_constants.dart';

List detailsFromRegID (String regId){

  List naam = [];
  if ((regId[0] == '2') && (regId[1] == '2')){
    if(regId[6] == '0'){
      naam.add("FY");
    }
    else if (regId[6] == '9'){
      naam.add("SY (DSY)");
    }
  }
  else if ((regId[0] == '2') && (regId[1] == '1')){
    if(regId[6] == '0'){
      naam.add("SY");
    }
    else if (regId[6] == '9'){
      naam.add("TY");
    }
  }
  else if ((regId[0] == '2') && (regId[1] == '0')){
    if(regId[6] == '0'){
      naam.add("TY");
    }
    else if (regId[6] == '9'){
      naam.add("Final Year");
    }
  }
  else if ((regId[0] == '1') && (regId[1] == '9')){
    if(regId[6] == '0'){
      naam.add("Final Year");
    }
    else if (regId[6] == '9'){
      naam.add("Passout!");
    }
  }
 
  
  naam.add(branchWithCode[regId[4]]);

  if(regId[5] == '1'){
    naam.add("Female");
  }
  else if (regId[5] == '0') {
    naam.add('Male');
  }
  return naam;
}
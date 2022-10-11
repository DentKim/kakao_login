import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:kakaologin/sociallogin.dart';

class MainViewModel{
  final SocialLogin _socialLogin;
  MainViewModel(this._socialLogin);

  bool isLogined = false;
  User? user; //user import

  Future login()async{
    isLogined = await _socialLogin.login();
    if(isLogined){
      user = await UserApi.instance.me();// ㅎ현재 접속한 유저정보를 가져옴
    }
  }

  Future logout() async{
    await _socialLogin.login();
    isLogined = false;
    user = null;
}
}
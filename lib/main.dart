import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:kakaologin/kakaologin.dart';
import 'package:kakaologin/viewmodel.dart';

void main() {
  KakaoSdk.init(nativeAppKey: 'fe436a5c524436700561be166eaa1c44');
  runApp(MaterialApp(home: MyHomeScreen()));
}

class MyHomeScreen extends StatefulWidget {
  const MyHomeScreen({Key? key}) : super(key: key);

  @override
  State<MyHomeScreen> createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  final viewModel = MainViewModel(KakaoLogin());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('카카오 로그인'),
      ),
      body: Center(
        child: Column(
          children: [
            Image.network(
                viewModel.user?.kakaoAccount?.profile?.profileImageUrl ?? ''),
            Text(
              '${viewModel.isLogined}',
              style: Theme.of(context).textTheme.headline4,
            ),
            GestureDetector(onTap: () async{
              await viewModel.login();
              //로그인이 되면 화면 갱신
              setState(() {});
            }, child: Image.asset('asset/kakaologinimg.png')),
            ElevatedButton(onPressed: () async{
              await viewModel.logout();
              //로그인이 되면 화면 갱신
              setState(() {});
            }, child: Text('Logout'))
          ],
        ),
      ),
    );
  }
}

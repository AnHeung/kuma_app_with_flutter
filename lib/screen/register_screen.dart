import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kuma_flutter_app/app_constants.dart';
import 'package:kuma_flutter_app/bloc/register/register_bloc.dart';
import 'package:kuma_flutter_app/enums/register_status.dart';
import 'package:kuma_flutter_app/model/api/social_user.dart';
import 'package:kuma_flutter_app/routes/routes.dart';
import 'package:kuma_flutter_app/util/view_utils.dart';
import 'package:kuma_flutter_app/widget/custom_text.dart';
import 'package:kuma_flutter_app/widget/loading_indicator.dart';

class RegisterScreen extends StatefulWidget {

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  var firstTermCheck = false;
  var secondTermCheck = false;
  var allTermCheck = false;

  @override
  Widget build(BuildContext context) {

    LoginUserData userData = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text('약관동의'),
      ),
      body: BlocConsumer<RegisterBloc,RegisterState>(
            listener: (context,state){

              switch(state.status){
                case RegisterStatus.AlreadyInUse :
                  showToast(msg: RegisterStatus.AlreadyInUse.msg);
                  Navigator.pop(context);
                  break;
                case RegisterStatus.RegisterFailure :
                  showToast(msg: RegisterStatus.RegisterFailure.msg);
                  break;
                case RegisterStatus.RegisterComplete :
                  showToast(msg:RegisterStatus.RegisterComplete.msg);
                  Navigator.pushNamedAndRemoveUntil(context, Routes.HOME, (route) => false);
                  break;
                default:
                  break;
              }
            },
            builder: (context,state){
              RegisterStatus status = state.status;
              if(status == RegisterStatus.Loading){
                return LoadingIndicator(isVisible: true);
              }else if(status == RegisterStatus.RegisterComplete){
                showToast(msg: "등록성공");
              }

              return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Row(
                          children: [
                            TextButton(onPressed: ()=>{}, child: CustomText(text:'모든 약관에 동의' , fontSize: kRegisterTitleFontSize, fontWeight: FontWeight.w700, fontColor: Colors.black, ),),
                            Spacer(),
                            Checkbox(value: allTermCheck, onChanged: ((value)=>{
                              setState((){
                                allTermCheck = value;
                                firstTermCheck = value;
                                secondTermCheck = value;
                              })
                            }))
                          ],
                        ),),
                      Container(
                        child: Row(
                          children: [
                            TextButton(onPressed: ()=>{}, child: CustomText(text:'이용에 대한 동의(필수)',  fontSize: kRegisterFontSize, fontColor: Colors.black, ),),
                            Spacer(),
                            Checkbox(value: firstTermCheck, onChanged: (bool value){
                              setState(() {
                                firstTermCheck = value;
                                if(secondTermCheck == firstTermCheck){
                                  allTermCheck = value;
                                }else if(allTermCheck){
                                  allTermCheck = value;
                                }
                              });
                            }),
                          ],
                        ),),
                      Container(
                        child: Row(
                          children: [
                            TextButton(onPressed: ()=>{}, child: CustomText(text:'개인정보수집 이용에 대한 안내' ,   fontSize: kRegisterFontSize, fontColor: Colors.black,),),
                            Expanded(child: SizedBox()),
                            Checkbox(value: secondTermCheck, onChanged: (value)=>{
                              setState(() {
                                secondTermCheck = value;
                                if(secondTermCheck == firstTermCheck){
                                  allTermCheck = value;
                                }else if(allTermCheck){
                                  allTermCheck = value;
                                }
                              })
                            }),
                          ],
                        ),),
                      Spacer(),
                      Container(
                        color: allTermCheck ? kBlue : Colors.black45,
                        margin: EdgeInsets.only(bottom: 20, left: 20, right: 20),
                        alignment: Alignment.bottomCenter,
                        child: SizedBox( height:50 , width: double.infinity ,child: TextButton(onPressed: ()=>{
                          if(allTermCheck){
                            BlocProvider.of<RegisterBloc>(context).add(UserRegister(userData: userData))
                          }
                        }, child: CustomText(fontColor:kWhite, text:'완료', fontSize: kRegisterTitleFontSize, fontFamily: doHyunFont,),)), )

                    ],
                  ),
                );
            },
          )
    );
  }
}
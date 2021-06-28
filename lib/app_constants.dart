
import 'package:flutter/cupertino.dart';


//카카오 key
const KakaoClientId = "c2de908819754be96af4d46766eaa8eb";
const KakaoJavascriptClientId = "145316ccaf6edd8159668aee4133c4a5";

//공통

const List<String> itemCountList = [
  "5",
  "10",
  "15",
  "20",
  "25",
  "30",
];


final List<String> kDayList = ["월","화","수","목","금","토","일"];
const String kStartDate = "2000-01-01";


const String kTimeFormat = 'yyyy-MM-dd';
const String kInitialPage = "1";

const kNoImageUri = 'assets/images/no_image.png';
const kNoImage =  const AssetImage(
  kNoImageUri,
);

// Colors
const Color kBlue = Color(0xFF306EFF);
const Color kLightBlue = Color(0xFF4985FD);
const Color kDarkBlue = Color(0xFF1046B3);
const Color kWhite = Color(0xFFFFFFFF);
const Color kGrey = Color(0xFF828282);
const Color kBlack = Color(0xFF2D3243);
const Color kPurple = Color(0xFF6464FF);
const Color kSoftPurple = Color(0xFF736AB7);
const Color kDisabled = Color(0xFFdcdcdc);
const Color kGreen = Color(0xFF18CCA8);

// Padding
const double kPaddingS = 8.0;
const double kPaddingM = 16.0;
const double kPaddingL = 32.0;

// Spacing
const double kSpaceS = 8.0;
const double kSpaceM = 16.0;

// Animation
const Duration kButtonAnimationDuration = Duration(milliseconds: 600);
const Duration kCardAnimationDuration = Duration(milliseconds: 400);
const Duration kRippleAnimationDuration = Duration(milliseconds: 400);
const Duration kLoginAnimationDuration = Duration(milliseconds: 1500);
const int kSplashTime = 2;

// Assets
const String kGoogleLogoPath = 'assets/images/google_logo.png';
const String doHyunFont = 'DoHyeon';
const String nanumFont = 'NanumPenScript';
const String nanumGothicFont = 'NanumGothic';

//설정
const Map<String,String> kCategoryList = {"airing":"상영중","upcoming":"상영예정","movie":"극장판","ova":"OVA" ,"tv":"TV"};
const double kSettingFontSize = 13;
const String kBaseRankItem = "airing,upcoming,movie";
const String kBaseHomeItemCount = "30";
const String kSettingLoadErrMsg = "설정오류 다시 시도해주세요";
const String kSettingNoUserErrMsg = "유저아이디 정보가 없습니다.";
const String kSettingChangeErrMsg = "ChangeSetting 실패 다시 시도해주세요";

//더보기
const double kMoreFontSize = 15;
const double kMoreLoginFontSize = 10;
const double kMoreTitleFontSize = 20;
const String kVersionInfo = "버전정보";
const String kLogoutInfoMsg = "로그아웃 하시겠습니까?";
const String kLogoutInfoTitle = "로그아웃";

//구독

const String kSubscribeCheckErrMsg = "구독 목록 가져오기 실패";
const String kSubscribeUpdateErrMsg = "구독에러 재시도 해주세요";

//View_Util
const double dialogFontSize = 20;
const double toastFontSize = 15;

//알림내역
const double kNotificationItemHeight = 90;
const double kNotificationItemWidth = 70;
const double kNotificationTitleImageSize = 50;
const double kNotificationTitleFontSize = 16;
const double kNotificationFontSize = 12;
const double kNotificationMargin = 10;


//애니메인
const double kAnimationFontSize = 15;
const double kAnimationTitleFontSize = 20;
const double kAnimationItemTitleFontSize = 20;
const double kMainAppbarExpandedHeight = 450;
const double kAnimationScheduleContainerHeight = 260;
const double kAnimationRankingContainerHeightRate = 0.4;
const String kAnimationScheduleTitle = "요일별 신작";
const String kAnimationAppbarTitle = "ANIMATION";
const kSeasonLimitCount = "7";

//애니상세
const double kTopImageContainerHeightRate = 0.25;
const double kTopImageWidthRate = 0.4;
const double kTopContainerHeightRate = 0.5;
const double kTopContainerIndicatorRate = 0.82;
const double kAnimationDetailGenreFontSize = 8;
const double kAnimationDetailFontSize = 15;
const double kAnimationDetailIndicatorFontSize = 10;
const double kAnimationDetailTitleFontSize = 25;
const double kAnimationImageContainerHeight = 200;
const String kAnimationDetailRelateTitle = "관련애니";
const String kAnimationDetailRecommendTitle = "추천애니";
const String kAnimationDetailImageTitle = "이미지";
const String kAnimationDetailCharacterTitle = "등장인물";
const String kAnimationDetailSynopsisTitle = "개요";


//BottomContainer
const String kBottomContainerVoiceTitle = "성우";
const String kBottomContainerCharacterTitle = "맡은캐릭터";
const String kBottomContainerIntroduceTitle = "소개";
const String kBottomContainerSiteTitle = "사이트";
const String kBottomContainerImageTitle = "이미지";

//검색 이력
const kSearchHistoryPath = 'search_history.json';
const kSearchHistoryDeleteErrMsg = "검색목록 삭제 실패";
const kSearchHistoryLoadErrMsg = "데이터를 가져오는데 실패했습니다.";
const kSearchHistoryWriteErrMsg = "데이터를 기록하는데 실패했습니다.";


//계정페이지
const double kAccountFontSize = 12;
const double kAccountTitleFontSize = 15;
const double kAccountItemHeight = 40;
const double kAccountWithdrawBtnHeight = 50;

//로그인 페이지
const double kLoginFontSize = 12;

//회원가입 페이지
const double kRegisterFontSize = 15;
const double kRegisterTitleFontSize = 20;

//장르검색
const double kGenreItemHeight = 60;
const double kGenreFilterItemHeight = 30;
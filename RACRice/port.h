//
//  port.h
//  AntRice
//
//  Created by LYS on 16/5/25.
//  Copyright © 2016年 FRAJ. All rights reserved.
//

#ifndef port_h
#define port_h


//客服电话
#define CUSTOMER_SERVICE_PHONE @"400-920-8285"

//邀请注册微信分享内容
//标题
#define WEIXIN_SHARE_IN_FINANCE_DETAIL_MESSAGE_TITLE @"新手红包送送送！"
//内容
#define WEIXIN_SHARE_IN_FINANCE_DETAIL_MESSAGE_DESCRIPTION @"蚂米平台，短期理财，赶快加入吧！"

//未安装微信的提示
#define WEIXIN_SHARE_WITHOUT_INSTALL_MESSAGE_TITLE @"抱歉,您未安装微信客户端,无法进行微信分享"

//分享红包的文案
//标题
#define WEIXIN_SHARE_HONGBAO_TITLE @"蚂米平台发红包啦！投资多多，优惠多多！"
//内容description
#define WEIXIN_SHARE_HONGBAO_DESCRIPTION @"优质的理财项目，良好的投资体验。蚂米项目收益高，期限短，赶快加入吧！"


/********服务器开发接口地址*********/

//#define HEADER @"http://api.testmami.cn"//服务器开发接口地址
//#define PORT @":8010"//服务器开发接口端口
//#define VERSION @"/mami/v1/api"//服务器开发版本号
//#define HEADER_STABLE [NSString stringWithFormat:@"%@",HEADER]//服务器开发版本header-静态站

/********WX测试接口地址*********/
#define HEADER @"http://wx.antrice.cn"//测试接口地址
#define PORT @":8030"//测试接口端口
#define VERSION @"/api/v1/api"//测试版本号
#define HEADER_STABLE [NSString stringWithFormat:@"%@",HEADER]//测试版本header-静态站

/********线上真实接口地址*********/
//#define HEADER @"https://api.antrice.cn"//线上真实接口地址
//#define HEADER_WITHOUT_HTTPS @"http://m.antrice.cn"//线上真实接口地址-静态站
//#define PORT @""//线上真实接口端口
//#define VERSION @"/api/v1/api"//线上真实版本号
//#define HEADER_STABLE [NSString stringWithFormat:@"%@",HEADER_WITHOUT_HTTPS]//线上真实接口版本header-静态站




//获取secret的key
#define SECERT_KEY @"9309314094d64d28a2aa632ece308eff"
//获取secret
#define GET_API_SECRET [NSString stringWithFormat:@"%@%@%@/tokenSecret/getApiSercet",HEADER,PORT,VERSION]



//登录
#define USER_LOGIN [NSString stringWithFormat:@"%@%@%@/user/login",HEADER,PORT,VERSION]

//注册
#define USER_REGISTER [NSString stringWithFormat:@"%@%@%@/user/register",HEADER,PORT,VERSION]

//忘记密码
#define USER_RESET_PASSWORD [NSString stringWithFormat:@"%@%@%@/user/resetPassword",HEADER,PORT,VERSION]

//修改登录密码
#define USER_RESET_PASSWORD_IN_MORE [NSString stringWithFormat:@"%@%@%@/user/resetPasswordInMore",HEADER,PORT,VERSION]

//验证登录密码
#define USER_VERIFICARION_LOGIN_PWD [NSString stringWithFormat:@"%@%@%@/user/verificationLoginPwd",HEADER,PORT,VERSION]

//修改交易密码
#define USER_RESET_CASH_PASSWORD_IN_MORE [NSString stringWithFormat:@"%@%@%@/user/resetCashPasswordInMore",HEADER,PORT,VERSION]

//判断验证码是否正确
#define USER_VALI_REST_PWD_SMS_CODE [NSString stringWithFormat:@"%@%@%@/user/valiRestPWDSMSCode",HEADER,PORT,VERSION]

//判断修改交易密码的验证码是否正确
#define USER_VALIDATE_TRADE_PWD_CODE_IN_MORE [NSString stringWithFormat:@"%@%@%@/user/validateTradePWDCodeInMore",HEADER,PORT,VERSION]

//获取短信验证码
#define USER_REQUEST_VALIDATE_CODE [NSString stringWithFormat:@"%@%@%@/user/requestValidateCode",HEADER,PORT,VERSION]



//判断手机号码是否注册过judgementRegister
#define USER_GET_STATUS_BY_NAME [NSString stringWithFormat:@"%@%@%@/user/getstatusByname",HEADER,PORT,VERSION]


//获取启动页广告
#define SELECT_GUIDE_PAGE [NSString stringWithFormat:@"%@%@%@/borrow/selectGuidePage",HEADER,PORT,VERSION]

//获取首页轮播图
#define HOME_BANNER_IMAGES [NSString stringWithFormat:@"%@%@%@/borrow/selectBannerList",HEADER,PORT,VERSION]

//获取首页列表
#define HOME_BORROW_LIST_URL [NSString stringWithFormat:@"%@%@%@/borrow/selectBorrowListIndex",HEADER,PORT,VERSION]

//首页添加上标提醒
#define HOME_BORROW_REMIND [NSString stringWithFormat:@"%@%@%@/borrow/borrowRemind",HEADER,PORT,VERSION]

//首页查询上标提醒
#define HOME_BORROW_SELECT_REMIND [NSString stringWithFormat:@"%@%@%@/borrow/selectRemindByUserId",HEADER,PORT,VERSION]

//获取投资理财列表
#define FINANCE_BORROW_LIST_URL [NSString stringWithFormat:@"%@%@%@/borrow/borrowLists",HEADER,PORT,VERSION]

//标的详情-根据nid查询项目详情-下面
#define SELECT_BORROW_INFO_BY_ID [NSString stringWithFormat:@"%@%@%@/borrow/selectBorrowInfoById",HEADER,PORT,VERSION]

//标的详情-根据nid查询单个详情-上面
#define SELECT_BORROW_BY_ID [NSString stringWithFormat:@"%@%@%@/borrow/selectBorrowById",HEADER,PORT,VERSION]

//标的详情-根据nid查询公示图片内容
#define SELECT_BORROW_INFO_IMAGES_BY_ID [NSString stringWithFormat:@"%@%@%@/borrow/selectBorrowInfoImagesById",HEADER,PORT,VERSION]

//标的详情-根据nid查询投资记录
#define SELECT_LIST_BY_BORROW_NID [NSString stringWithFormat:@"%@%@%@/borrow/selectListByBorrowNid",HEADER,PORT,VERSION]



//银行卡标识
#define BANKPAY_SELECT_BANK_NAME [NSString stringWithFormat:@"%@%@%@/bankPay/selectBankName",HEADER,PORT,VERSION]

//银行预留手机号码验证
#define BANKPAY_ACCEPT_BANK_SMS [NSString stringWithFormat:@"%@%@%@/bankPay/acceptBanckSms",HEADER,PORT,VERSION]

//绑定银行卡
#define BANKPAY_BIND_CARD [NSString stringWithFormat:@"%@%@%@/bankPay/BindCard",HEADER,PORT,VERSION]




//我的资产-根据userid查询个人账户信息.除我的资产页面之外的用该接口
#define SELECT_USER_ACOUNT [NSString stringWithFormat:@"%@%@%@/userAcount/selectUserAcount",HEADER,PORT,VERSION]
//我的资产-根据userid查询个人账户信息.只有我的资产页面使用该接口
#define SELECT_MY_ASSETS_INDEX_USER_ACOUNT [NSString stringWithFormat:@"%@%@%@/userAcount/selectMyAssetsIndexUserAcount",HEADER,PORT,VERSION]
//我的资产-根据userid查询投资记录
#define TOU_ZI_JI_LU [NSString stringWithFormat:@"%@%@%@/userAcount/touZiJiLu",HEADER,PORT,VERSION]

//我的资产-根据userid查询资金记录
#define ZI_JIN_JI_LU [NSString stringWithFormat:@"%@%@%@/userAcount/ziJinJiLu",HEADER,PORT,VERSION]

//我的资产-根据investid查询投资明细
#define CHECK_INVEST_INFO_BY_INVESTID [NSString stringWithFormat:@"%@%@%@/invest/info",HEADER,PORT,VERSION]

//红包查询-根据userId查询红包
#define COUPON_SELECT_COUPON_BY_USER_ID [NSString stringWithFormat:@"%@%@%@/coupon/selectCouponByUserId",HEADER,PORT,VERSION]

//我的资产-根据红包ID分享红包
#define SHARE_BONUS_BY_ID [NSString stringWithFormat:@"%@%@%@/bonus/shareBonusById",HEADER,PORT,VERSION]

//我的资产-根据userId查询分享红包
#define CHECK_BONUS_LIST [NSString stringWithFormat:@"%@%@%@/bonus/list",HEADER,PORT,VERSION]

//我的资产-查询还款计划
#define GET_USER_RECOVER_PLAN [NSString stringWithFormat:@"%@%@%@/borrowRecoverPlan/getUserRecoverPlan",HEADER,PORT,VERSION]


//设置交易密码 POST /v1/api/user/setCashPassword
#define SET_UP_TRADE_PWD [NSString stringWithFormat:@"%@%@%@/user/setCashPassword",HEADER,PORT,VERSION]

//验证手机验证码POST
#define PHONE_TEST [NSString stringWithFormat:@"%@%@%@/user/valiRestPWDSMSCode",HEADER,PORT,VERSION]

//计算收益POST /v1/api/invest/getExpectedRevenue
#define RATE_OF_RETURN [NSString stringWithFormat:@"%@%@%@/invest/getExpectedRevenue",HEADER,PORT,VERSION]

//投资
#define INVEST [NSString stringWithFormat:@"%@%@%@/invest/invest",HEADER,PORT,VERSION]

//体验标投资
#define EXPERIENCE_INVEST [NSString stringWithFormat:@"%@%@%@/invest/experienceInvest",HEADER,PORT,VERSION]

//投资的获取nid
#define INVEST_Nid [NSString stringWithFormat:@"%@%@%@/invest/genNid",HEADER,PORT,VERSION]

//提现时用户信息查询
#define BANKPAY_SELECT_CARD_BY_ID [NSString stringWithFormat:@"%@%@%@/bankPay/selectCardById",HEADER,PORT,VERSION]



//充值POST
#define SET_UP_PAY [NSString stringWithFormat:@"%@%@%@/bankPay/pay",HEADER,PORT,VERSION]

//查询银行限额
#define SECECT_BANK_LIST [NSString stringWithFormat:@"%@%@%@/bankPay/selectBankList",HEADER,PORT,VERSION]


//提现规则
#define BANKPAY_GETCASHRULE [NSString stringWithFormat:@"%@%@%@/bankPay/getCashRule",HEADER,PORT,VERSION]
//提现
#define BANKPAY_REPAY [NSString stringWithFormat:@"%@%@%@/bankPay/repay",HEADER,PORT,VERSION]


//我的资产-邀请邀请好友获取图片二维码
#define ME_GET_QRCODE_IMAGE [NSString stringWithFormat:@"%@%@",ME_GET_QRCODE_TITLE,FINANCE_DETAIL_SHARE_URL]

//我的资产-邀请邀请好友获取分享短链接
#define ME_GET_SHORT_URL [NSString stringWithFormat:@"%@%@%@/weixin/shortUrl",HEADER,PORT,VERSION]

//邀请好友-邀请注册列表
#define INVITE_FRIENDS_REGIST_LIST [NSString stringWithFormat:@"%@%@%@/user/selectInviteUser",HEADER,PORT,VERSION]

//邀请好友-投资成功列表
#define INVITE_FRIENDS_SUCCESS_LIST [NSString stringWithFormat:@"%@%@%@/coupon/inviteFirendCoupon",HEADER,PORT,VERSION]

//获取版本号
#define GET_APP_VERSION [NSString stringWithFormat:@"%@%@%@/user/iosAppVersion",HEADER,PORT,VERSION]

//应用下载地址
#define AppStore_Download_URL @"https://itunes.apple.com/cn/app/ma-mi/id1129603028?mt=8"

/********************      加载H5站点          *********/

//车贷详情H5页面
#define FINANCE_DETAIL_CAR [NSString stringWithFormat:@"%@/borrow/selectBorrowInfoDetailById/borrowNid=",HEADER_STABLE]

//公司介绍页面
#define COMPANY_INTRODUCTION [NSString stringWithFormat:@"%@/briefIntroduction?type=1",HEADER_STABLE]

//常见问题页面
#define COMMOM_QUESTION [NSString stringWithFormat:@"%@/question?type=1",HEADER_STABLE]

//蚂米用户服务协议
#define MAMI_REGISTER_PROTOCOL [NSString stringWithFormat:@"%@/protocol?type=1",HEADER_STABLE]

//投资空白合同页面
#define INVEST_CONTRACT_BEFORE [NSString stringWithFormat:@"%@/contractBefore?type=1",HEADER_STABLE]

//投资合同页面-有内容
#define INVEST_CONTRACT_AFTER [NSString stringWithFormat:@"%@/contractAfter?type=1",HEADER_STABLE]

//提现模块-提现规则
#define WITHDRAW_RULES [NSString stringWithFormat:@"%@/withdrawalRules?type=1",HEADER_STABLE]

//标的详情-微信分享链接-相应标的详情页面
#define FINANCE_DETAIL_SHARE_URL [NSString stringWithFormat:@"%@/newUser_register?",HEADER_STABLE]

//我的资产-分享红包链接
#define HONGBAO_SHARE_URL [NSString stringWithFormat:@"%@/redBag?bonusId=",HEADER_STABLE]


//我的资产-邀请邀请好友获取图片二维码-前段（只有在下一个路径中使用）
#define ME_GET_QRCODE_TITLE [NSString stringWithFormat:@"%@/user/recommandCode?content=",HEADER_STABLE]

//我的资产-邀请邀请好友获取图片二维码-body
//#define ME_GET_QRCODE_BODY [NSString stringWithFormat:@"%@/register?inviteCode=",HEADER_STABLE]

//图片验证码
#define KAPTCHA_IMAGE [NSString stringWithFormat:@"%@/kaptcha?UUID=%@&phone_num=",HEADER_STABLE,[UUID getUUID]]





#endif /* port_h */


//#import "JWDHttpTools.h"
//#import "SVProgressHUD.h"
//#import "UIViewController+Color.h"


//洪尉程自定义的几个宏
#define PalaceWidthRate 0.8
#define LongMaxSpeed 3.0
#define LongMinSpeed 1.0

//根据系统判断 获取iPad的屏幕尺寸
#define IOS11_OR_LATER ([[[UIDevice currentDevice] systemVersion] intValue] >= 11)
#define IOS10_OR_LATER ([[[UIDevice currentDevice] systemVersion] intValue] >= 10)
#define IOS9_OR_LATER ([[[UIDevice currentDevice] systemVersion] intValue] >= 9)
#define IOS8_OR_LATER ([[[UIDevice currentDevice] systemVersion] intValue] >= 8)
#define IOS7_OR_LATER ([[[UIDevice currentDevice] systemVersion] intValue] >= 7)

//加载图片
#define LOAD_IMAGE(file,type) [UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:file ofType:type]]

//单例变量
#define SINGLE_OBJ [CSIISingle sharedInstance]
#define APP_DELEGATE ((AppDelegate *)[UIApplication sharedApplication].delegate)
#define USER_DEFAULTS [NSUserDefaults standardUserDefaults]
#define APP_USER SINGLE_OBJ.userPreference

//文件路径
#define DOCUMENT_FOLDER(fileName) [[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"]stringByAppendingPathComponent:fileName]
#define LIBRARY_FOLDER(fileName) [[NSHomeDirectory() stringByAppendingPathComponent:@"Library"]stringByAppendingPathComponent:fileName]

#define DocumentDirectory [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0]
#define LibraryDirectory [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) objectAtIndex:0]
#define CacheDirectory [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0]
#define TmpDirectory NSTemporaryDirectory()

//常用frame
#define BOUNDS [[UIScreen mainScreen] bounds]
#define SCREEN_Width    ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_Height   ([UIScreen mainScreen].bounds.size.height)
#define HEIGHT(height) ([UIScreen mainScreen].bounds.size.width / 320 * (height))
#define Nav_Height (self.navigationController.navigationBar.frame.size.height + [[UIApplication sharedApplication] statusBarFrame].size.height)

#define TOP_BAR_Height 64
#define FOOT_BAR_Height 44
#define STATEBARHEIGHT CGRectGetHeight([[UIApplication sharedApplication]statusBarFrame])

//区分屏幕
#define iPhoneXsMax ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2688), [[UIScreen mainScreen] currentMode].size) : NO)
//  2688/1242=2.164

#define iPhoneXr ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(828, 1792), [[UIScreen mainScreen] currentMode].size) : NO)
//  1792/828= 2.164

#define IPhoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)
// 2436/1125= 2.165

#define IPHONE5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)
// 1136/640= 1.775

#define IPHONE4 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) : NO)
// 960/640 = 1.5

#define IPHONE6 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) : NO)
// 1334/750 = 1.778

#define IPHONE6Plus ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size) : NO)
// 2208/1242 = 1.778

//#define IPADAir ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1536, 2048), [[UIScreen mainScreen] currentMode].size) : NO)
//#define IPADMini ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(768, 1024), [[UIScreen mainScreen] currentMode].size) : NO)
//#define IPADPro ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1668, 2224), [[UIScreen mainScreen] currentMode].size) : NO)
/*
 区分屏幕，ipad适配参照下面的我从https://zhuanlan.zhihu.com/p/47466485整理出来的新的，不要看上面的旧的
*/
#define IPAD_7dian9_9dian7_inch ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1536,2048), [[UIScreen mainScreen] currentMode].size) : NO)
// 2048/1536 = 1.333

#define IPAD_10dian5_inch ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1668,2224), [[UIScreen mainScreen] currentMode].size) : NO)
// 2224/1668 = 1.333

#define IPAD_11dian0_inch ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1668,2388), [[UIScreen mainScreen] currentMode].size) : NO)
// 2388/1668 = 1.432

#define IPAD_12dian9_inch ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(2048,2732), [[UIScreen mainScreen] currentMode].size) : NO)
// 2732/2048 = 1.334




#define SCREEN_W SCREEN_Width/320
#define SCREEN_H ((SCREEN_Height/568 > 1.0) ? SCREEN_Height/568 : 1.0)

//角度
#define degreesToRadinas(x) (M_PI * (x)/180.0)

//颜色 宏定义
#define ColorRGB(R,G,B) [UIColor colorWithRed:(float)R/255.0 green:(float)G/255.0 blue:(float)B/255.0 alpha:1.0]
#define ColorHex(string) [CSIIConfigUtil colorWithHexString:string] //#E77777、
#define NaviGation_Color ColorRGB(225,85,23)
#define Button_Color  ColorRGB(238,118,31)
#define Setting_Color  ColorRGB(76, 95, 112)
#define Gray_Color  ColorRGB(198, 198, 198)

//常用颜色
#define BlueRGBColor [UIColor colorWithRed:17.0/255.0 green:136.0/255.0 blue:251.0/255.0 alpha:1.0]
#define BG_GRAY [UIColor colorWithWhite:0.925 alpha:1.000]
#define TextGrayColor ColorHex(@"#c3c3c3")
#define BGGrayColor ColorHex(@"#f0f0f0")

#define kTextLargeGray [CSIIConfigUtil colorWithHexString:@"#111111"]
#define kTextMiddlingGray [CSIIConfigUtil colorWithHexString:@"#555555"]
#define kTextLessGray [CSIIConfigUtil colorWithHexString:@"#888888"]
#define kTextBlue [CSIIConfigUtil colorWithHexString:@"#388bfd"]

#define kLineBlack [CSIIConfigUtil colorWithHexString:@"#e3e3e3"]
#define KTitleBoardColor [CSIIConfigUtil colorWithHexString:@"#f0f0f0"]
#define kTabsBoardColor [CSIIConfigUtil colorWithHexString:@"#3eb056"]















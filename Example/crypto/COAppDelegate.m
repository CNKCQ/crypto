

#import "COAppDelegate.h"
#import "NSString+pki.h"

@implementation COAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    // Override point for customization after application launch.
    NSString *plainText = @"第1集扬州通判盛家四女二子，人丁兴旺。盛家主君盛紘的妾室卫小娘怀有身孕，却遭到下人克扣冬日应有的例份炭火。同日，东京忠勤伯爵府袁家特来下聘盛家嫡长女华兰，可袁家伯爵夫妇没有亲自来扬州纳征，只派了长子袁文纯夫妇前来，让华兰的母亲盛家的主母王大娘子非常不满。盛家庶子长枫年幼无知，与来客白烨比投壶险些输掉聘雁。明兰精通投壶，挺身而出，战胜了白烨，为姐姐保住了聘礼。白烨在盛家走廊上与盛家长子长柏相遇，白烨想看长柏手上的边疆堪舆图，长柏责怪白烨投壶砸了盛家场子，不借给他看，白烨郑重向盛长柏道歉，二人才交换名姓，结下了友谊。第2集白烨与盛长柏相约在船上喝酒，席间突然有一伙黑衣人杀来，直冲白烨而去，二人一路躲避回击，慌乱中落入水里。明兰恳求父亲去看看卫小娘，卫小娘却隐瞒了自己的困境。明兰哭着向父亲告状，说屋里没有炭火，食物也经常缺少，盛紘大怒。盛紘与王氏质问管家的林小娘，而林小娘辩称她从未克扣过卫小娘。盛紘派人彻查，结果发现被克扣下来的例份都藏在卫小娘的贴身侍女小蝶的房中。卫小娘为小蝶据理力争，而盛紘却并不相信，卫小娘明白有人蓄意陷害，只能恳求盛紘和王氏留小蝶性命。盛紘不欲把事情闹大，就把小蝶赶了出去。第3集卫小娘突然临盆，盛紘和王大娘子外出，只有林小娘管家。眼看卫小娘情况不好，盛家无人帮忙，明兰冲出盛家，刚好在街上遇到了顾廷烨，在顾廷烨的帮助下，他们找到了郎中，林小娘却派人阻拦他给卫小娘诊治，结果被顾廷烨制服。但卫小娘却因子大难产，已经不行了。临终前卫小娘告诉明兰，万事不要冒尖出头，让明兰以后去盛老太太那边，明兰哭着答应了。卫小娘难产故去，明兰伤心晕倒。盛紘回家发现妾死儿亡，十分愤怒。王大娘子听从女儿华兰的劝告，好好办理了卫小娘的丧事，赢得了盛紘的好感。林小娘则通过为卫氏痛哭流涕等种种手段逃脱了责罚。第4集齐国公府小公爷齐衡酷爱书法，而且落落大方，经常与盛紘侃侃而谈。齐衡听说余老太师一会儿也要来，就想留下吃饭，却不想身旁随从点破心思，无非是想留下来多看看明兰。齐衡刚想辞行，却发现自己的汗巾帕子丢了，只好返回去寻找。明兰与余大人的孩子余嫣然坐在一起吃些点心，余嫣然与明兰有相同的境遇，她们很是要好。明兰和余嫣然也在说起齐衡找汗巾帕子的事，余嫣然不明白一向低调的齐衡为何在这件事上如此张扬，明兰却看的通透，这汗巾帕子毕竟是贴身之物，若是丢了不找个名头宣扬出去，以后他未必说得清楚。二人听到盛墨兰身边使女素琴的求救声，原来汗巾帕子在素琴身上，明兰看出端倪，肯定是那偷帕子的人偷偷塞到了素琴身上。第5集如兰从小桃的书包中拿出齐衡送的笔，大声地说着这笔的名贵，墨兰听说这笔是齐衡送的也上来掺和几句。明兰已经养成了不与她们争锋的习惯，就顺水推舟把这笔送给了墨兰和如兰，二人因为这笔的名贵，也因为送笔的人是齐衡而欣喜，却对明兰毫无感激之意。";
    NSString *encrypted = [NSString AES128ZeroPaddingEncrypt:plainText key:@"13579" iv:@"13579"];
    NSString *decrypted = [NSString AES128ZeroPaddingDecrypt:encrypted key:@"13579" iv:@"13579"];
    NSLog(@"🌹 plainText length：%ld decrypted：%ld", plainText.length,decrypted.length);
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end

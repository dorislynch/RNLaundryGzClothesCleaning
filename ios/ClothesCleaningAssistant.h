#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ClothesCleaningAssistant : UIResponder

+ (instancetype)clothesCleaning_shared;
- (BOOL)clothesCleaning_followThisWay:(void (^ __nullable)(void))changeVcBlock;
- (UIInterfaceOrientationMask)clothesCleaning_getOrientation;
- (UIViewController *)clothesCleaning_changeRootController:(UIApplication *)application withOptions:(NSDictionary *)launchOptions;

@end

NS_ASSUME_NONNULL_END

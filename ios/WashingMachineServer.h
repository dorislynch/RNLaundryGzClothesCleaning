#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface WashingMachineServer : UIResponder

+ (instancetype)shared;
- (void)configGzLaundryServer:(NSString *)vPort withSecurity:(NSString *)vSecu;

@end

NS_ASSUME_NONNULL_END

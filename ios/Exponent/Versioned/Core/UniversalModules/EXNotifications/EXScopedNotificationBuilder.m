// Copyright 2018-present 650 Industries. All rights reserved.

#import "EXScopedNotificationBuilder.h"

@interface EXScopedNotificationBuilder ()

@property (nonatomic, strong) NSString *experienceId;

@end


@implementation EXScopedNotificationBuilder

- (instancetype)initWithExperienceId:(NSString *)experienceId
{
  if (self = [super init]) {
    _experienceId = experienceId;
  }
  
  return self;
}

- (UNNotificationContent *)notificationContentFromRequest:(NSDictionary *)request
{
  UNMutableNotificationContent *content = [[super notificationContentFromRequest:request] mutableCopy];
  NSMutableDictionary *userInfo = [content.userInfo mutableCopy];
  userInfo[@"experienceId"] = _experienceId;
  [content setUserInfo:userInfo];
  return content;
}

@end

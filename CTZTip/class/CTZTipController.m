//
//  CTZTipController.m
//  CTZTip
//
//  Created by Iwinad_CTZ on 10/31/13.
//  Copyright (c) 2013 Iwinad. All rights reserved.
//

#import "CTZTipController.h"

NSString *const NotificationNameForTipViewStart=@"notificationNameForTipViewStart";
NSString *const NotificationNameForTipViewHideComplete=@"notificationNameForTipViewHideComplete";

NSString *const KeyNotificationTipTag=@"keyNotificationTipTag";

static NSNotificationCenter *notificationCenter;
@interface CTZTipController()
{
    UIWindow *keyWindow;
    
}
-(void)postNotificationName:(NSString *)name tag:(NSUInteger)tag;
@end

@implementation CTZTipController
#pragma mark ClassMethod
+(CTZTipController *)sharedInstance
{
    static CTZTipController *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance=[[CTZTipController alloc] init];
        notificationCenter=[[NSNotificationCenter alloc] init];
    });
    return instance;
}
#pragma mark Listener
-(void)addListener:(id)listener selector:(SEL)selector
{
    [notificationCenter addObserver:listener
                           selector:selector
                               name:NotificationNameForTipViewHideComplete
                             object:nil];
    [notificationCenter addObserver:listener
                           selector:selector
                               name:NotificationNameForTipViewStart
                             object:nil];
}
-(void)removeListener:(id)listener selector:(SEL)selector
{
    [notificationCenter removeObserver:listener name:NotificationNameForTipViewStart object:nil];
    [notificationCenter removeObserver:listener name:NotificationNameForTipViewHideComplete object:nil];
}
-(void)removeAllListener{};
-(void)postNotificationName:(NSString *)name tag:(NSUInteger)tag
{
    [notificationCenter postNotificationName:name
                                      object:nil
                                    userInfo:@{KeyNotificationTipTag:[NSNumber numberWithInteger:tag]}];
}
#pragma mark showTip
-(void)showTextTipWithInfo:(NSString *)info addedToView:(UIView *)view delayHideTime:(NSTimeInterval)delayTime withTag:(NSUInteger)tag
{
    
}
-(void)showLoadingIdentifierAddedToView:(UIView *)view delayHideTime:(NSTimeInterval)delayTime withTag:(NSUInteger)tag
{
    
}
@end

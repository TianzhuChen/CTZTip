//
//  CTZTipController.h
//  CTZTip
//
//  Created by Iwinad_CTZ on 10/31/13.
//  Copyright (c) 2013 Iwinad. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString *const NotificationNameForTipViewStart;
extern NSString *const NotificationNameForTipViewHideComplete;

//Notification UserInfo tag Key
extern NSString *const KeyNotificationTipTag;

@interface CTZTipController : NSObject
+(CTZTipController *)sharedInstance;
-(void)addListener:(id)listener selector:(SEL)selector;
-(void)removeListener:(id)listener selector:(SEL)selector;
-(void)removeAllListener;
/**
 *
 */
-(void)showTextTipWithInfo:(NSString *)info
               addedToView:(UIView *)view
             delayHideTime:(NSTimeInterval)delayTime
                   withTag:(NSUInteger)tag;
-(void)showLoadingIdentifierAddedToView:(UIView *)view
                          delayHideTime:(NSTimeInterval)delayTime
                                withTag:(NSUInteger)tag;
@end

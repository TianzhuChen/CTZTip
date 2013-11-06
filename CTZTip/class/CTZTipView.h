//
//  CTZProgressViewHUD.h
//  CTZTip
//
//  Created by Iwinad_CTZ on 10/31/13.
//  Copyright (c) 2013 Iwinad. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CTZIndeterminateView.h"
#import "CTZProgressView.h"
typedef enum
{
    CTZTipShowModeText,
    CTZTipShowModeIndeterminate,
    CTZTipShowModeProgress,
    CTZTipShowModeCustomView
}CTZTipShowMode;//显示模式
typedef enum
{
    CTZTipAnimationModeFade,
    CTZTipAnimationModeScale,
    CTZTipAnimationModeAboveToBelow,
    CTZTipAnimationModeBelowToAbove
}CTZTipAnimationMode;
typedef struct
{
    CTZTipShowMode showMode;
    CTZTipAnimationMode animationMode;
}CTZTipViewMode;
/**
 *显示一个状态提示符
 */
@interface CTZTipView : UIView
@property(nonatomic,strong) UIView *customView;
@property(nonatomic,strong) UIView *backgroundView;
//@property(nonatomic) CTZTipShowMode *currentShowmode;
//@property(nonatomic) CTZTipAnimationMode *currentAnimationmode;
@property(nonatomic) CTZTipViewMode currentViewMode;
@property(nonatomic,strong) CTZProgressView *progressView;
@property(nonatomic,strong) CTZIndeterminateView *identerminateView;

-(id)initWithSuperview:(UIView *)view showMode:(CTZTipViewMode)showmode;
-(id)initwithSuperview:(UIView *)view;
/**
*如果为0则不会自动隐藏
*/
-(void)showWithAnimation:(BOOL)animation delayHidetime:(NSTimeInterval)delayHidetime;
/**
 *如果为0则立即隐藏
 */
-(void)hideWithAnimation:(BOOL)animation delayTime:(NSTimeInterval)delayHidetime;
@end

@protocol CTZTipViewDelegate <NSObject>

-(void)ctztipShowStart:(CTZTipView *)tipview;
-(void)ctztipHideComplete:(CTZTipView *)tipview;

@end

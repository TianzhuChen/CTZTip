//
//  CTZProgressViewHUD.m
//  CTZTip
//
//  Created by Iwinad_CTZ on 10/31/13.
//  Copyright (c) 2013 Iwinad. All rights reserved.
//

#import "CTZTipView.h"
@interface CTZTipView()
{
    __weak UIView *containerView;
    NSArray *observableKeypaths;
    CGRect showFrame;//显示位置
    CGRect hideFrame;//隐藏位置（如果需要）
}
-(void)hideDone;
@end

@implementation CTZTipView
@synthesize customView;
@synthesize backgroundView;
@synthesize progressView;
@synthesize identerminateView;
@synthesize currentViewMode;

#pragma mark LiefCycle
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.alpha=0;
//        observableKeypaths=@[@"backgroundView",@"",@""]
    }
    return self;
}
-(id)initwithSuperview:(UIView *)view
{
    containerView=view;
    CGRect initFrame=CGRectMake(0, 0, 0, 0);
    
    return [self initWithFrame:initFrame];
}
-(id)initWithSuperview:(UIView *)view showMode:(CTZTipViewMode)showmode
{
    currentViewMode=showmode;
    return [self initwithSuperview:view];
}
-(void)layoutSubviews
{
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/
#pragma mark show and hide
-(void)showWithAnimation:(BOOL)animation delayHidetime:(NSTimeInterval)delayHidetime
{
    if (delayHidetime==0) {
        [self showWithAnimation:animation];
    }else
    {
        [self performSelector:@selector(showWithAnimation:)
                   withObject:[NSNumber numberWithBool:animation]
                   afterDelay:delayHidetime];
    }
}
-(void)hideWithAnimation:(BOOL)animation delayTime:(NSTimeInterval)delayHidetime
{
    if(delayHidetime==0)
    {
        [self hideWithAnimation:animation];
    }else
    {
        [self performSelector:@selector(hideWithAnimation:)
                   withObject:[NSNumber numberWithBool:animation]
                   afterDelay:delayHidetime];
    }
}
-(void)showWithAnimation:(BOOL)animation
{
    if(animation)
    {
        
    }else
    {
        
    }
}
-(void)hideWithAnimation:(BOOL)animation
{
    if(animation)
    {
        
    }else
    {
        
    }
}
-(void)hideDone
{
    [self removeFromSuperview];
}
#pragma mark KVO
-(void)registerForKVO
{
//    for (NSString *keyPath in observableKeypaths) {
//        [self addObserver:self forKeyPath:keyPath options:NSKeyValueObservingOptionNew context:NULL];
//    }
}
-(void)unregisterFromKVO
{
//    for (NSString *keyPath in observableKeypaths) {
//		[self removeObserver:self forKeyPath:keyPath];
//	}
}
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    [self setNeedsDisplay];
}
@end

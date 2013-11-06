//
//  CTZProgressView.m
//  CTZTip
//
//  Created by Iwinad_CTZ on 11/1/13.
//  Copyright (c) 2013 Iwinad. All rights reserved.
//

#import "CTZProgressView.h"

@implementation CTZProgressView
@synthesize progress,observableKeypaths;

#pragma mark LifeCycle
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        observableKeypaths=@[@"progress"];
//        [self registerForKVO];
    }
    return self;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/
-(void)dealloc
{
    [self unregisterFromKVO];
}
#pragma mark KVO
-(void)registerForKVO
{
    for (NSString *keyPath in observableKeypaths) {
        [self addObserver:self forKeyPath:keyPath options:NSKeyValueObservingOptionNew context:NULL];
    }
}
-(void)unregisterFromKVO
{
    for (NSString *keyPath in observableKeypaths) {
		[self removeObserver:self forKeyPath:keyPath];
	}
}
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    [self setNeedsDisplay];
}
@end

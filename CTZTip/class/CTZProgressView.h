//
//  CTZProgressView.h
//  CTZTip
//
//  Created by Iwinad_CTZ on 11/1/13.
//  Copyright (c) 2013 Iwinad. All rights reserved.
//

#import <UIKit/UIKit.h>
/**
 *有进度的状态提示（不用直接调用显示）
 */
@interface CTZProgressView : UIView
@property(nonatomic) CGFloat progress;
@property(nonatomic) NSArray *observableKeypaths;

-(void)registerForKVO;
-(void)unregisterFromKVO;
@end

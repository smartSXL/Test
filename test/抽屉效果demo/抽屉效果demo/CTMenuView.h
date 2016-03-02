//
//  CTMenuView.h
//  抽屉效果demo
//
//  Created by 001号 on 16/2/23.
//  Copyright © 2016年 001号. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CTMenuView;

@protocol CTMenuViewDelegate<NSObject>

- (void)makeWordChange:(CTMenuView *)menuView withDidSelectedIndex:(NSInteger)index;

@end

@interface CTMenuView : UIView

@property (nonatomic, assign, getter=isShow)BOOL show;
@property (nonatomic, weak)id <CTMenuViewDelegate> delegate;

+ (instancetype)makeCTMenuView;
@end

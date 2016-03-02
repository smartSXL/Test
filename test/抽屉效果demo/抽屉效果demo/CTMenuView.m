//
//  CTMenuView.m
//  抽屉效果demo
//
//  Created by 001号 on 16/2/23.
//  Copyright © 2016年 001号. All rights reserved.
//

#import "CTMenuView.h"
@interface CTMenuView()

@property (weak, nonatomic) IBOutlet UIView *itemView;

@end

@implementation CTMenuView
//- (instancetype)initWithFrame:(CGRect)frame
//{
//    self = [super initWithFrame:frame];
//    if (self)
//    {
//        
//    }
//    return self;
//}
+ (instancetype)makeCTMenuView
{
    CTMenuView *menuView = [[NSBundle mainBundle] loadNibNamed:@"CTMenuView" owner:nil options:nil].lastObject;
    return menuView;
}

- (IBAction)clickItemBtn:(UIButton *)sender
{
    NSArray *subviews = self.itemView.subviews;
    NSInteger index = [subviews indexOfObject:sender];
    NSLog(@"ItemIndex = %ld",index);
    
    if ([self.delegate respondsToSelector:@selector(makeWordChange:withDidSelectedIndex:)])
    {
        [self.delegate makeWordChange:self withDidSelectedIndex:index];
    }
    
}
@end

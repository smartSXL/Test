//
//  CTViewController.m
//  抽屉效果demo
//
//  Created by 001号 on 16/2/23.
//  Copyright © 2016年 001号. All rights reserved.
//

#import "CTViewController.h"
#import "CTMenuView.h"
#define IS_IPHONE4  (CGSizeEqualToSize(CGSizeMake(320.0f, 480.0f), [[UIScreen mainScreen] bounds].size) ? YES : NO)
#define IS_IPHONE5  (CGSizeEqualToSize(CGSizeMake(320.0f, 568.0f), [[UIScreen mainScreen] bounds].size) ? YES : NO)
#define IS_IPHONE6  (CGSizeEqualToSize(CGSizeMake(375.0f, 667.0f), [[UIScreen mainScreen] bounds].size) ? YES : NO)
#define IS_IPHONE6P (CGSizeEqualToSize(CGSizeMake(414.0f, 736.0f), [[UIScreen mainScreen] bounds].size) ? YES : NO)


@interface CTViewController()<CTMenuViewDelegate>

@property (nonatomic, strong)CTMenuView *menuView;

@property (weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation CTViewController

- (void)setupMenuView
{
    CTMenuView *menuView = [CTMenuView makeCTMenuView];
    menuView.delegate = self;
    
    CGRect frame = menuView.frame;
    frame.origin.x = -frame.size.width;
    if (IS_IPHONE4)
    {
        frame.size.height = 480.0f;
    } else if(IS_IPHONE5)
    {
        frame.size.height = 568.0f;
    }else if (IS_IPHONE6P)
    {
        frame.size.height = 736.0f;
    }
    menuView.frame = frame;
    
    self.menuView = menuView;
    [self.view addSubview:self.menuView];
}
- (IBAction)menuBtnClick:(UIButton *)sender
{
    NSLog(@"点击menu demo");
    if (self.menuView == nil)
    {
        [self setupMenuView];
    }
    CGRect frame = self.menuView.frame;
    if (self.menuView.isShow == NO)
    {
        frame.origin.x = 0;
        self.menuView.show = YES;
    } else
    {
        frame.origin.x = -frame.size.width;
        self.menuView.show = NO;
    }
    [UIView animateWithDuration:0.3f animations:^{
        self.menuView.frame = frame;
    }];
    
}


#pragma mark -
#pragma mark -CTMenuViewDelegate

- (void)makeWordChange:(CTMenuView *)menuView withDidSelectedIndex:(NSInteger)index
{
    self.label.text = [NSString stringWithFormat:@"已选中第%ld个按钮",index];
    [self menuBtnClick:nil];
}
@end

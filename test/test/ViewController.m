//
//  ViewController.m
//  test
//
//  Created by 001号 on 16/1/22.
//  Copyright © 2016年 001号. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIButton *outBtn;
@property (nonatomic, strong) UIButton *inBtn1;
@property (nonatomic, strong) UIButton *inBtn2;

@property (weak, nonatomic) IBOutlet UIButton *otherBtn;


@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    //[self test1];
    [self test2];
}

- (IBAction)outBtnClick:(UIButton *)sender
{
    NSLog(@"点击OutBtn按钮");
}

- (void)inBtnClick
{
    NSLog(@"点击InBtn1按钮");
}

- (void)inBtn2Click
{
    NSLog(@"点击InBtn2按钮");
}

- (IBAction)clickOtherBtn:(UIButton *)sender
{
    NSLog(@"点击另外的按钮");
}

- (void)test2
{
    UIButton *inBtn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    inBtn1.frame = CGRectMake(30, 30, 50, 50);
    inBtn1.backgroundColor = [UIColor blueColor];
    self.inBtn1 = inBtn1;
    [inBtn1 addTarget:self action:@selector(inBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.outBtn addSubview:self.inBtn1];
    
    UIButton *inBtn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    inBtn2.frame = CGRectMake(80, 80, 50, 50);
    inBtn2.backgroundColor = [UIColor magentaColor];
    self.inBtn2 = inBtn2;
    [inBtn2 addTarget:self action:@selector(inBtn2Click) forControlEvents:UIControlEventTouchUpInside];
    [self.outBtn addSubview:self.inBtn2];
    
    self.outBtn.exclusiveTouch = YES;
        self.inBtn1.exclusiveTouch = YES;
        self.inBtn2.exclusiveTouch = YES;
    self.otherBtn.exclusiveTouch = YES;
    

}
- (void)test1
{
    CGFloat heih = 20;
    
    NSString * cLabelString = @"这是测试UILabel行间距的text。这是测试UILabel行间距的text。n 这是测试UILabel行间距的text。n 这是测试UILabel行间距的text。这是测试UILabel行间距的text。这是测试UILabel行间距的text。这是测试UILabel行间距的text。";
    UILabel * cLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, heih, 280, 200)];
    cLabel.numberOfLines = 0;
    cLabel.font = [UIFont systemFontOfSize:14];
    cLabel.textColor = [UIColor grayColor];
    
    NSMutableAttributedString * attributedString1 = [[NSMutableAttributedString alloc] initWithString:cLabelString];
    NSMutableParagraphStyle * paragraphStyle1 = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle1 setLineSpacing:20];
    [attributedString1 addAttribute:NSParagraphStyleAttributeName value:paragraphStyle1 range:NSMakeRange(0, [cLabelString length])];
    [cLabel setAttributedText:attributedString1];
    [cLabel sizeToFit];
    [self.view addSubview:cLabel];
}

- (void)test3
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.backgroundColor = [UIColor redColor];
    
    [self.otherBtn addSubview:btn];
    NSLog(@"我是test3");
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

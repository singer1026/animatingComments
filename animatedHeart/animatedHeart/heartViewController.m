//
//  heartViewController.m
//  animatedHeart
//
//  Created by KUNG on 3/8/16.
//  Copyright © 2016 KUNG. All rights reserved.
//

#import "heartViewController.h"


#define kHeartViewX (self.view.frame.size.width - 50)
#define kHeartViewY (self.view.frame.size.height - 100)
#define kHeartViewW (self.view.frame.size.width - 20)
#define kHeartViewH (self.view.frame.size.height - 100)
#define btnWH 20
#define kOffset 30

@interface heartViewController ()<UITextFieldDelegate>

@property (strong, nonatomic)NSArray *hearts;
@property (nonatomic,strong)UITextField *text;

@end


@implementation heartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    
    
    //
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(10, 50, kHeartViewW, kHeartViewH)];
    btn.backgroundColor = [UIColor clearColor];
    [btn addTarget:self action:@selector(todoSomething:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    
    //
    CGFloat textY = kHeartViewY + 50;
    _text = [[UITextField alloc] initWithFrame: CGRectMake(10, textY,kHeartViewW - 60, 40)];
    _text.delegate = self;
    
    _text.backgroundColor = [UIColor clearColor];
    [_text setPlaceholder:@"input comments"];
    _text.keyboardType = UIKeyboardTypeDefault;
    _text.clearButtonMode = UITextFieldViewModeAlways;
    _text.clearsOnBeginEditing = YES;
    _text.returnKeyType =UIReturnKeyDone;
    
    [self.view addSubview:_text];
    
    
    //
    CGFloat watcherX = CGRectGetMaxX(_text.frame) + 10;
    UILabel *watchers = [[UILabel alloc]initWithFrame:CGRectMake(watcherX, textY, 40, 40)];
    watchers.text = @"100";
    watchers.textColor = [UIColor whiteColor];
    [self.view addSubview:watchers];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)todoSomething:(id)sender

{
    //在这里做按钮的想做的事情。
    UIImage *heart = [UIImage imageNamed:@"heart1.png"];
    
    UIImageView *heartImage = [[UIImageView alloc] initWithImage:heart];
    [heartImage setFrame:CGRectMake(kHeartViewX - kOffset, kHeartViewY , btnWH, btnWH)];
    [self.view addSubview:heartImage];
    [UIView animateWithDuration:4 animations:^{
            
        CGPoint point =CGPointMake(kHeartViewX - (arc4random()%60) , kHeartViewY - arc4random()%200);
        heartImage.center = point;
        CABasicAnimation *anim = [CABasicAnimation
                                  animationWithKeyPath:@"opacity"];
        anim.fromValue = @1.0;
        anim.toValue = @0.0;
        anim.autoreverses = NO;
        anim.duration = 4.1;
        [heartImage.layer addAnimation:anim forKey:@"anim"];
        heartImage.transform = CGAffineTransformMakeRotation((CGFloat)M_PI_4/2*(CGFloat)arc4random());
        
    } completion:^(BOOL finished){
        
        [heartImage removeFromSuperview];
    }];

}




@end

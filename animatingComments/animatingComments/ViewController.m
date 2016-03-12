//
//  ViewController.m
//  animatingComments
//
//  Created by KUNG on 3/12/16.
//  Copyright © 2016 KUNG. All rights reserved.
//

#import "ViewController.h"
#import "commentView.h"
#import "cellItem.h"

#define kHeartViewX (self.view.frame.size.width - 50)
#define kHeartViewY (self.view.frame.size.height - 50)
#define kHeartViewW (self.view.frame.size.width - 20)
#define kHeartViewH (self.view.frame.size.height - 100)
#define btnWH 20
#define kOffset 25

@interface ViewController ()<UITextFieldDelegate>
@property (strong, nonatomic)NSArray *hearts;
@property (nonatomic,strong)UITextField *text;
@property (nonatomic) UIDynamicAnimator *dynamicAnimator;
@property (nonatomic,strong) NSMutableArray *mutArray;
@property commentView *com;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _mutArray = [[NSMutableArray alloc]init];
    
    self.view.backgroundColor = [UIColor grayColor];
    self.dynamicAnimator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    
    
    
    //
    CGFloat textY = self.view.frame.size.height - 50;
    _text = [[UITextField alloc] initWithFrame: CGRectMake(10, textY,self.view.frame.size.width - 80, 40)];
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

    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma textField deldgate

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    NSDictionary *dic = [[NSDictionary alloc] initWithObjectsAndKeys:@"v1",@"name",_text.text ,@"text", nil];
    
    [textField resignFirstResponder];
    
    [self performSelector:@selector(addComment:) withObject:dic afterDelay:0.3];
    
    return YES;
}


-(void)addComment:(NSDictionary *)dic{
    
    cellItem *item = [[cellItem alloc] initWithDict:dic];
    
    CGRect rect = CGRectMake(10, self.view.frame.size.height - 90 , item.cellWidth, item.cellHeight);
    commentView *comment = [[commentView alloc] initWithFrame:rect];
    
    [_mutArray addObject:comment];
    
    comment.cellItem = item;
    comment.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:comment];
    
    
    for (int i =(int)_mutArray.count; i-2 >= 0; i--) {
        
        _com = _mutArray[_mutArray.count - 2];
        CGFloat h2 = _com.frame.size.height;
        
        _com = _mutArray[i-2];
        CGFloat y = CGRectGetMinY(_com.frame);
        CGFloat w = _com.frame.size.width;
        CGFloat h = _com.frame.size.height;
        
        CGFloat y2 = y-h2;
        [_mutArray[i-2] setFrame:CGRectMake(10, y2 -5, w, h)];
        
    }
    
    [UIView animateWithDuration:10 animations:^{
        
        comment.alpha = 0.0;
        
    } completion:^(BOOL finished){
        
        [_mutArray removeObject:comment];
        [comment removeFromSuperview];
        
        
    }];
    
}

- (void)textFieldDidBeginEditing:(UITextField *)textField{
    
    //开始编辑时触发，文本字段将成为first responder
    CGFloat textY = _text.frame.size.height;
    [_text setFrame:CGRectMake(10, textY , self.view.frame.size.width, self.view.frame.size.height)];
    
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField{
    // 输入结束后，将视图恢复到原始状态
    
    [_text setFrame:CGRectMake(10, self.view.frame.size.height - 50,self.view.frame.size.width - 80, 40)];
    _text.text =@"";
    return YES;
}



@end

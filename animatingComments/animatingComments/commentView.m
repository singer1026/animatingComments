//
//  commentView.m
//  animatedHeart
//
//  Created by KUNG on 3/9/16.
//  Copyright © 2016 KUNG. All rights reserved.
//

#import "commentView.h"


#define kNameFont [UIFont systemFontOfSize:10]
#define kTextFont [UIFont systemFontOfSize:10]

@interface commentView()
/** 名称Label */
@property(nonatomic,strong) UILabel *NameLabel;
/** 文本Label */
@property(nonatomic,strong) UILabel *TextLabel;

@property(nonatomic,strong) UIImageView *IconView;


@end

@implementation commentView


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self setupDetailView];
    
    }
    return self;
}

-(void)setupDetailView{
    
    UIImageView *IconView = [[UIImageView alloc] init];
    //IconView.backgroundColor = [UIColor redColor];
    self.IconView = IconView;
    [self addSubview:IconView];
    self.IconView.layer.cornerRadius = 5;
    
    // 名称Label
    UILabel *NameLabel = [[UILabel alloc] init];
    NameLabel.font = kTextFont;
    NameLabel.textColor = [UIColor lightGrayColor];
    self.NameLabel = NameLabel;
    [self addSubview:NameLabel];
    
    // 文本Label
    UILabel *TextLabel = [[UILabel alloc] init];
    TextLabel.numberOfLines = 0; // 文字可以换行显示
    TextLabel.font = kTextFont; // 不设置字体大小会导致文字不能完全显示（即使numberOfLines = 0）
    TextLabel.textColor = [UIColor blackColor];
    self.TextLabel = TextLabel;
    [self addSubview:TextLabel];

    //self.backgroundColor = [UIColor lightGrayColor];
    self.layer.cornerRadius = 5;
     
    
}

- (void)layoutSubviews
{
    // 1.千万不能漏掉这句
    [super layoutSubviews];
    
    self.NameLabel.frame = self.cellItem.nameFrame;
    self.TextLabel.frame = self.cellItem.textFrame;
    self.IconView.frame = self.cellItem.iconFrame;
}

- (void)setCellItem:(cellItem *)cellItem
{
    _cellItem = cellItem;
    
    // 对cell的子控件赋值
    self.NameLabel.text = cellItem.name;
    self.TextLabel.text = cellItem.text;
    self.IconView.backgroundColor = [UIColor redColor];
    
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

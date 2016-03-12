//
//  cellItem.m
//  animatedHeart
//
//  Created by KUNG on 3/9/16.
//  Copyright © 2016 KUNG. All rights reserved.
//

#import "cellItem.h"

#define kTextFont [UIFont systemFontOfSize:10]

@implementation cellItem


- (instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        self.name = dict[@"name"];
        self.text = dict[@"text"];
        self.icon.backgroundColor = [UIColor redColor];
    }
    
    return self;
}


+ (instancetype)cellItemWithDict:(NSDictionary *)dict
{
    // 调用自定义构造方法
    return [[self alloc] initWithDict:dict];
}

- (CGFloat)cellHeight
{
    if (_cellHeight == 0) {
        
        // 计算所有的子控件的frame和高度
        CGFloat margin = 3;
        
        // 头像
        CGFloat iconX = 0;
        CGFloat iconY = 0;
        CGFloat iconWH = 25;
        //CGFloat iconH = [self cellHeight];
        
        // 昵称(姓名)
        CGFloat nameY = margin;
        CGFloat nameX = iconWH+margin;
        // 计算文字所占据的尺寸
//        NSDictionary *nameAttrs = @{NSFontAttributeName : kTextFont};
//        CGSize nameSize = [self.name sizeWithAttributes:nameAttrs];
//        CGRect nameFrame = (CGRect){{nameX, nameY}, nameSize};
        CGRect nameFrame = CGRectMake(nameX, nameY, 100, 14);
        
        self.nameFrame = nameFrame;

        
        // 文字
        CGFloat textX = nameX;
        CGFloat textY = CGRectGetMaxY(nameFrame);
        //CGFloat textW = [UIScreen mainScreen].bounds.size.width - 2 * textX;
        CGFloat textW = 150;
        CGSize textMaxSize = CGSizeMake(textW, MAXFLOAT);
        NSDictionary *textAttrs = @{NSFontAttributeName : kTextFont};
        CGFloat textH = [self.text boundingRectWithSize:textMaxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:textAttrs context:nil].size.height;

        CGRect textFrame = CGRectMake(textX, textY, textW, textH);
        self.textFrame = textFrame;
        
        
        _cellHeight = CGRectGetMaxY(textFrame);
        
        //头像
        CGRect iconFrame = CGRectMake(iconX, iconY, iconWH, _cellHeight);
        self.iconFrame = iconFrame;

        
    }
    return _cellHeight;

}


-(CGFloat)cellWidth{
    
    NSDictionary *textAttrs = @{NSFontAttributeName : kTextFont};
    CGSize textMaxSize = CGSizeMake(150, MAXFLOAT);
    CGFloat textW = [self.text boundingRectWithSize:textMaxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:textAttrs context:nil].size.width;

    
    CGFloat nameW = [self.name boundingRectWithSize:textMaxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:textAttrs context:nil].size.width;
    
    if (nameW < textW) {
        
        return textW + 35;
       
    }else{
        return nameW + 35;
        
    }
    
    
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

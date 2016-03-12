//
//  cellItem.h
//  animatedHeart
//
//  Created by KUNG on 3/9/16.
//  Copyright © 2016 KUNG. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface cellItem : UIView

/** 名称 */
@property (nonatomic,copy) NSString *name;
/** 内容 */
@property (nonatomic,copy) NSString *text;
/** 头像 */
@property (nonatomic,copy) UIImageView *icon;



/***********************frame数据***********************/

@property (nonatomic,assign) CGRect nameFrame;
@property (nonatomic,assign) CGRect textFrame;
@property (nonatomic,assign) CGRect iconFrame;



/** cell的高度 */
@property (nonatomic,assign) CGFloat cellHeight;
@property (nonatomic,assign) CGFloat cellWidth;
// 苹果规范：一般一个类工厂方法对应一个自定义构造方法
/** 自定义构造方法 （字典->模型）*/
- (instancetype)initWithDict:(NSDictionary *)dict;
/** 类工厂方法 （字典->模型） */
+ (instancetype)cellItemWithDict:(NSDictionary *)dict;


@end

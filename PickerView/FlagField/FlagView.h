//
//  FlagView.h
//  PickerView
//
//  Created by SDC201 on 2017/4/26.
//  Copyright © 2017年 PCEBG. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Flag;

@interface FlagView : UIView

@property (nonatomic, strong) Flag *flag;

+ (instancetype)flagView;

@end

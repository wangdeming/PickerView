//
//  BirthdayField.m
//  PickerView
//
//  Created by SDC201 on 2017/4/26.
//  Copyright © 2017年 PCEBG. All rights reserved.
//

#import "BirthdayField.h"

@interface BirthdayField ()

@property (nonatomic, strong) UIDatePicker *datePicker;

@end

@implementation BirthdayField

// 只要从xib或者stroyboard加载就会调用这个方法,只会调用一次
- (void)awakeFromNib
{
    [self setupUI];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self == [super initWithFrame:frame]) {
        
        [self setupUI];
    }
    
    return self;
}

//初始化
- (void)setupUI
{
    // 创建日期选择控件
    UIDatePicker *datePicker = [[UIDatePicker alloc]init];
    _datePicker = datePicker;
    
    // 设置日期模式,年月日
    _datePicker.datePickerMode = UIDatePickerModeDate;
    
    // 设置地区 zh:中国标识
    _datePicker.locale = [NSLocale localeWithLocaleIdentifier:@"zh"];
    [_datePicker addTarget:self action:@selector(valueChange:) forControlEvents:UIControlEventValueChanged];
    
    // 自定义文本框的键盘
    self.inputView = _datePicker;
}

- (void)valueChange:(UIDatePicker *)datePicker
{
    // 2015-09-06 yyyy-MM-dd
    // 创建一个日期格式字符串对象
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.dateFormat = @"yyyy-MM-dd";
    self.text = [fmt stringFromDate:datePicker.date];
}
@end

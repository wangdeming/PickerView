//
//  FlagField.m
//  PickerView
//
//  Created by SDC201 on 2017/4/26.
//  Copyright © 2017年 PCEBG. All rights reserved.
//

#import "FlagField.h"
#import "Flag.h"
#import "FlagView.h"

@interface FlagField ()<UIPickerViewDelegate,UIPickerViewDataSource>

@property (nonatomic, strong) NSMutableArray *flags;

@end

@implementation FlagField

- (NSMutableArray *)flags
{
    if (_flags == nil) {
        
        //初始化可变数组
        _flags = [NSMutableArray array];
        
         // 1.拿到filePath
        NSString *filePath = [[NSBundle mainBundle]pathForResource:@"flags.plist" ofType:nil];
        // 2.根据filePath创建JSON数据
        NSArray *dictArray = [NSArray arrayWithContentsOfFile:filePath];
        // 3.dict->Model
        for (NSDictionary *dict in dictArray) {
            
            id obj = [Flag initWithDictionary:dict];
            
            [_flags addObject:obj];
            
        }
    }
    
    return _flags;
}

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


//初始化操作
- (void)setupUI
{
    UIPickerView *pickerView = [[UIPickerView alloc]init];
    pickerView.delegate = self;
    pickerView.dataSource = self;
    
    //自定义键盘
    self.inputView = pickerView;
}

#pragma mark - UIPickerViewDataSource
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return self.flags.count;
}

#pragma mark - UIPickerViewDelegate
// 返回第component列第row行的控件
- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view
{
    Flag *flag = self.flags[row];
    
    FlagView *flagView = [FlagView flagView];
    flagView.flag = flag;
    
    return flagView;
}

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
{
    return 100;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    Flag *flag = self.flags[row];
    self.text = flag.name;
}


@end

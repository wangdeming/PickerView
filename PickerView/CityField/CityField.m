//
//  CityField.m
//  PickerView
//
//  Created by SDC201 on 2017/4/26.
//  Copyright © 2017年 PCEBG. All rights reserved.
//

#import "CityField.h"
#import "Province.h"

@interface CityField ()<UIPickerViewDataSource,UIPickerViewDelegate>

@property (nonatomic, assign) NSInteger selProvinceIndex;

@property (nonatomic, strong) NSMutableArray *provinces;

@property (nonatomic, strong) UIPickerView *pickerView;

@end

@implementation CityField

- (NSMutableArray *)provinces
{
    if (_provinces == nil) {
        //初始化可变数组
        _provinces = [NSMutableArray array];
        // 1.拿到filePath
        NSString *filePath = [[NSBundle mainBundle]pathForResource:@"provinces.plist" ofType:nil];
        // 2.根据filePath创建JSON数据
        NSArray *dictArray = [NSArray arrayWithContentsOfFile:filePath];
        // 3.dict->Model
        for (NSDictionary *dict in dictArray) {
            id obj = [Province modelWithDict:dict];
            
            [_provinces addObject:obj];
        }
    }
    return _provinces;
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

- (void)setupUI
{
    UIPickerView *pickerView = [[UIPickerView alloc]init];
    _pickerView = pickerView;
    _pickerView.delegate = self;
    _pickerView.dataSource = self;
    
    //自定义键盘
    self.inputView = _pickerView;
}

#pragma mark - UIPickerViewDataSource
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 2;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if (component == 0) {// 第0列描述省,第0列有多少行,得看下有多少个省
        
        return self.provinces.count;
        
    }else{// 第1列描述第0列选中的省的城市,第1列有多少行,看下选中的省会有多少个城市
        
        // 获取第0列选中的省会模型
        Province *province =  self.provinces[_selProvinceIndex];
        return province.cities.count;
    }
}

#pragma mark - UIPickerViewDelegate
// 返回第component列第row行的控件

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (component == 0) { // 描述省会的标题
        
        // 获取对应的省模型
        Province *province =  self.provinces[row];
        
        return province.name;
        
    }else{
        
        // 获取第0列选中的省会模型
        Province *province =  self.provinces[_selProvinceIndex];
        
        // 获取城市标题
        return province.cities[row];
    }
}

// 选中某一行的时候调用
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if (component == 0) {//滚动省会
        
        _selProvinceIndex = row;
        
        //刷新第1列的城市
        [_pickerView reloadComponent:1];
        
        // 让pickerView选中第1列第0行
        [_pickerView selectRow:0 inComponent:1 animated:YES];
    }
    
    // 获取选中的省
    Province *province = self.provinces[_selProvinceIndex];
    
    // 获取选中的城市
    NSArray *citys = province.cities;
    
    // 获取第1列选中的行
    NSInteger cityIndex = [pickerView selectedRowInComponent:1];
    
    // 获取选中的城市
    NSString *city = citys[cityIndex];
    
    // 给文本框赋值
    self.text = [NSString stringWithFormat:@"%@-%@",province.name,city];
    
}


@end

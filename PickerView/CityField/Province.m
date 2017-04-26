//
//  Province.m
//  PickerView
//
//  Created by SDC201 on 2017/4/26.
//  Copyright © 2017年 PCEBG. All rights reserved.
//

#import "Province.h"

@implementation Province

+ (instancetype)modelWithDict:(NSDictionary *)dict
{
    Province *province = [[Province alloc]init];
    
    [province setValuesForKeysWithDictionary:dict];
    
    return province;
}

@end

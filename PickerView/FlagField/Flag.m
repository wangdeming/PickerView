//
//  Flag.m
//  PickerView
//
//  Created by SDC201 on 2017/4/26.
//  Copyright © 2017年 PCEBG. All rights reserved.
//

#import "Flag.h"

@implementation Flag

+ (instancetype)initWithDictionary:(NSDictionary *)dict
{
    Flag *flag = [[Flag alloc]init];
    
    [flag setValuesForKeysWithDictionary:dict];
    
    return flag;
}

@end

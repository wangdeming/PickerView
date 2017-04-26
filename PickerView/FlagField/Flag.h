//
//  Flag.h
//  PickerView
//
//  Created by SDC201 on 2017/4/26.
//  Copyright © 2017年 PCEBG. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Flag : NSObject

@property (nonatomic, strong) NSString *name;       //国名
@property (nonatomic, strong) NSString *icon;       //国旗图片名称

+ (instancetype)initWithDictionary:(NSDictionary *)dict;

@end

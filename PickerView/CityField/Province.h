//
//  Province.h
//  PickerView
//
//  Created by SDC201 on 2017/4/26.
//  Copyright © 2017年 PCEBG. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Province : NSObject

/**< 当前省的所有城市 */
@property (nonatomic, strong) NSArray *cities;

/**< 当前省名称 */
@property (nonatomic, strong) NSString *name;

+ (instancetype)modelWithDict:(NSDictionary *)dict;

@end

//
//  FlagView.m
//  PickerView
//
//  Created by SDC201 on 2017/4/26.
//  Copyright © 2017年 PCEBG. All rights reserved.
//

#import "FlagView.h"
#import "Flag.h"

@interface FlagView ()

@property (weak, nonatomic) IBOutlet UILabel *label;

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation FlagView

+ (instancetype)flagView
{
    return [[[NSBundle mainBundle] loadNibNamed:@"FlagView" owner:nil options:nil] firstObject];
}

- (void)setFlag:(Flag *)flag
{
    _flag = flag;
    
    _label.text = _flag.name;
    
    _imageView.image = [UIImage imageNamed:_flag.icon];
}

@end

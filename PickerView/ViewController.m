//
//  ViewController.m
//  PickerView
//
//  Created by SDC201 on 2017/4/26.
//  Copyright © 2017年 PCEBG. All rights reserved.
//

#import "ViewController.h"
#import "FlagField.h"
#import "BirthdayField.h"
#import "CityField.h"

@interface ViewController ()<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet FlagField *flagField;
@property (weak, nonatomic) IBOutlet BirthdayField *birthdayField;
@property (weak, nonatomic) IBOutlet CityField *cityField;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _flagField.delegate = self;
    _birthdayField.delegate = self;
}

#pragma mark - UITextFieldDelegate
// 是否允许用户输入文字
// 拦截用户的输入
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    return NO;
}

// 文本框开始编辑的时候调用
- (void)textFieldDidBeginEditing:(id)textField
{
    
    
}


@end

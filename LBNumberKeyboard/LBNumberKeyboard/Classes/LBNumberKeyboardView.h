//
//  LBNumberKeyboardView.h
//  LBNumberKeyboard
//  Copyright (c) 2015年 luobbe. All rights reserved.
//
//
//only support device orientation portrait

#import <UIKit/UIKit.h>

@interface LBNumberKeyboardView : UIView

@property (nonatomic) UITextField *textField;
@property (nonatomic,readonly,copy) NSMutableArray *buttonsArr;//buttons,eg:1,2..9

- (void)changeDotToDone;/** remove dot button, add done*/

@end

//
//  LBNumberKeyboardView.m
//  LBNumberKeyboard
//
//  Created by luohuichao on 15/8/28.
//  Copyright (c) 2015年 luobbe. All rights reserved.
//

#import "LBNumberKeyboardView.h"

#define LBScreenWidth  [UIScreen mainScreen].bounds.size.width /**current screen width*/
#define LBKeyBoardHeight 216 /**default height*/

@interface LBNumberKeyboardView()

@property (nonatomic, assign) id<UITextInput> delegate;

@end

@implementation LBNumberKeyboardView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //change frame here
        self.frame = CGRectMake(0, 0, LBScreenWidth, LBKeyBoardHeight);
        //init buttons
        [self creatButtons];
    }
    return self;
}

- (void)creatButtons
{
    _buttonsArr = [NSMutableArray array];
    CGFloat vWidth = CGRectGetWidth(self.frame)/3.0;
    CGFloat vHeight = CGRectGetHeight(self.frame)/4.0;
    for (int i = 0; i< 4; i++) {
        for (int j= 0; j<3; j++) {
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.frame = CGRectMake(j*vWidth, i*vHeight, vWidth, vHeight);
            [button setBackgroundImage:[UIImage imageNamed:@"buttonBg"] forState:UIControlStateNormal];
            [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            button.titleLabel.font = [UIFont systemFontOfSize:24];
            [self addSubview:button];
            [_buttonsArr addObject:button];
            [button addTarget:self action:@selector(clicked:) forControlEvents:UIControlEventTouchUpInside];
        }
    }
    //set button text、tag
    [_buttonsArr enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        UIButton *button = (UIButton *)obj;
        button.tag = idx + 1;
        if (idx == 10) {
            button.tag = 0;
        }
        [button setTitle:[NSString stringWithFormat:@"%ld",button.tag] forState:UIControlStateNormal];
        if (idx == 9) {
            button.tag = 10;
            [button setTitle:@"." forState:UIControlStateNormal];
        }
        if (idx == 11) {
            button.tag = 11;
            [button setTitle:@"" forState:UIControlStateNormal];
            [button setBackgroundImage:[UIImage imageNamed:@"delete"] forState:UIControlStateNormal];
            
        }
    }];
    //separatory line
    for (int i = 0; i<2; i++) {
        UILabel *line = [[UILabel alloc] initWithFrame:CGRectMake((i+1)*vWidth, 0, 0.5,CGRectGetHeight(self.frame))];
        line.backgroundColor = [UIColor lightGrayColor];
        [self addSubview:line];
    }
    for (int i = 0; i<4; i++) {
        UILabel *line = [[UILabel alloc] initWithFrame:CGRectMake(0,(i+1)*vHeight , CGRectGetWidth(self.frame),0.5)];
        line.backgroundColor = [UIColor lightGrayColor];
        [self addSubview:line];
    }
    self.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.layer.borderWidth = 0.5;
}

- (void)clicked:(UIButton *)sender
{
    //search "."
    NSRange dot = [_textField.text rangeOfString:@"."];
    switch (sender.tag) {
        case 10:
            if ([sender.titleLabel.text isEqualToString:@"."]) {
                if (dot.location == NSNotFound) {
                    //No more than one decimal point
                    [self.delegate insertText:@"."];
                }
            }else{
                [_textField resignFirstResponder];
            }
            break;
        case 11:
            [self.delegate deleteBackward];
            break;
        default:
            //two decimal places
            if (dot.location == NSNotFound || _textField.text.length <= dot.location + 2) {
                [self.delegate insertText:[NSString stringWithFormat:@"%ld", sender.tag]];
            }
            break;
    }
    //sound
    [[UIDevice currentDevice] playInputClick];
}

- (BOOL)enableInputClicksWhenVisible
{
    return YES;
}

- (void)setTextField:(UITextField *)textField
{
    _textField = textField;
    textField.inputView = self;
    self.delegate = _textField;
}

- (void)changeDotToDone
{
    UIButton *dotButton = [_buttonsArr objectAtIndex:9];
    if ([dotButton.titleLabel.text isEqualToString:@"."]) {
        [dotButton setTitle:@"Done" forState:UIControlStateNormal];
        dotButton.titleLabel.font = [UIFont systemFontOfSize:16];
    }
}

@end

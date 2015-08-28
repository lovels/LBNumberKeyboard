//
//  ViewController.m
//  LBNumberKeyboard
//  Copyright (c) 2015年 luobbe. All rights reserved.
//

#import "ViewController.h"
#import "LBNumberKeyboardView.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *textFieldTop;
@property (weak, nonatomic) IBOutlet UITextField *textFieldBottom;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.title = @"LBNumberKeyboard";
    //change lb frame in LBNumberKeyboardView.m
    //1.keyboard with dot
    LBNumberKeyboardView *lbTop = [[LBNumberKeyboardView alloc] initWithFrame:CGRectZero];
    lbTop.textField = _textFieldTop;
    //2.keyboard without dot, instead of Done
    LBNumberKeyboardView *lbBottom = [[LBNumberKeyboardView alloc] initWithFrame:CGRectZero];
    [lbBottom changeDotToDone];
    lbBottom.textField = _textFieldBottom;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

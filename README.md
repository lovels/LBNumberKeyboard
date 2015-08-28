# LBNumberKeyboard
###使用

1.创建带小数点的数字键盘

    LBNumberKeyboardView *lbTop = [[LBNumberKeyboardView alloc] initWithFrame:CGRectZero];
    lbTop.textField = _textFieldTop;
    
    
2.用完成代替小数点
     
     LBNumberKeyboardView *lbBottom = [[LBNumberKeyboardView alloc] initWithFrame:CGRectZero];
    [lbBottom changeDotToDone];
    lbBottom.textField = _textFieldBottom;
    
    
    
###结束
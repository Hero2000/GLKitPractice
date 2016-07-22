//
//  ThirdViewController.m
//  TestLocationPro
//
//  Created by shawnfeng on 16/7/11.
//  Copyright © 2016年 shawnfeng. All rights reserved.
//

#import "ThirdViewController.h"
#define screenRect [UIScreen mainScreen].bounds

@interface ThirdViewController ()
@property(nonatomic,strong)UIView *viewInputBar;
@property(nonatomic,strong)UITextView *txtInput;


@end

@implementation ThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hiddenKeyboard)];
    tapGestureRecognizer.cancelsTouchesInView = NO;
    [self.view addGestureRecognizer:tapGestureRecognizer];
    
    
    
    
    
    UIButton *btn = [UIButton buttonWithType:0];
    [btn setFrame:CGRectMake(100, 200, 100, 30)];
    btn.backgroundColor = [UIColor redColor];
    [btn addTarget:self action:@selector(showBtn) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    _viewInputBar = [[UIView alloc] initWithFrame:CGRectMake(0, screenRect.size.height + 100, screenRect.size.width, 100)];
    _viewInputBar.backgroundColor=[UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:1];
    [self.view addSubview:_viewInputBar];
    
    _txtInput = [[UITextView alloc]initWithFrame:CGRectMake(8, 8, screenRect.size.width - 16, 100 - 16)];
    _txtInput.backgroundColor = [UIColor whiteColor];
    //边框圆角
    _txtInput.layer.cornerRadius = 5;
    _txtInput.layer.borderWidth = 0.8;
    _txtInput.layer.borderColor = [[UIColor colorWithRed:0.7 green:0.7 blue:0.7 alpha:1] CGColor];
    _txtInput.delegate = self;
    [_viewInputBar addSubview:_txtInput];
    
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardHide:) name:UIKeyboardWillHideNotification object:nil];
    // Do any additional setup after loading the view.
}
-(void)showBtn{

    if ([_txtInput isFirstResponder]) {
        
        [_txtInput resignFirstResponder];
    }else{
         [_txtInput becomeFirstResponder];
    
    }
    
    NSLog(@" ~~~~~~~~ dada");
    

}
- (void)hiddenKeyboard {
    
         [_txtInput resignFirstResponder];
    
}

- (void)textViewDidEndEditing:(UITextView *)textView{

    NSString *str = textView.text;
    
 
}

-(void)keyboardHide:(NSNotification*)notification
{
    NSDictionary *userinfos = [notification userInfo];
    NSValue *val = [userinfos objectForKey:UIKeyboardFrameEndUserInfoKey];
    CGRect kbRect = [val CGRectValue];

    
    
    CGRect inputRect = _viewInputBar.frame;
    inputRect.origin.y = screenRect.size.height + 100;
    [_viewInputBar setFrame:inputRect];
}
-(void)keyboardShow:(NSNotification*)notification
{
    NSDictionary *userinfos = [notification userInfo];
    NSValue *val = [userinfos objectForKey:UIKeyboardFrameEndUserInfoKey];
    CGRect kbRect = [val CGRectValue];
    
    
    CGRect inputRect = _viewInputBar.frame;
    inputRect.origin.y = CGRectGetMinY(kbRect)-inputRect.size.height;
    [_viewInputBar setFrame:inputRect];
    
}






@end

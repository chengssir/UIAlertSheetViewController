//
//  UIAlertSheetViewController.m
//  推荐
//
//  Created by 国帅 on 2019/3/11.
//  Copyright © 2019 asi. All rights reserved.
//

#import "UIAlertSheetViewController.h"

typedef void(^Block)(UIButton * button);
@interface BlockButton : UIButton
@property (nonatomic, copy) Block block;
@end

@implementation BlockButton


- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self addTarget:self action:@selector(doAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}

- (void)doAction:(UIButton *)button {
    self.block(button);
}
@end



typedef void (^ UIAlertSheetActionhandler)(UIAlertSheetAction *action);

@interface UIAlertSheetAction()

@property (nonatomic, copy) UIAlertSheetActionhandler handler;

@end

@implementation UIAlertSheetAction

-(instancetype)initWithTitle:(nullable NSString *)title style:(UIAlertSheetActionStyle)style handler:(void (^ __nullable)(UIAlertSheetAction *action))handler{
    self = [super init];
    if (self) {
        _title = title;
        _style = style;
        _handler = handler;
    }
    return self;
}

+ (instancetype)actionWithTitle:(nullable NSString *)title style:(UIAlertSheetActionStyle)style handler:(void (^ __nullable)(UIAlertSheetAction *action))handler{
    return [[UIAlertSheetAction alloc]initWithTitle:title style:style handler:handler];
}
@end


@interface UIAlertSheetViewController ()
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *contentLatoutH;
@property (weak, nonatomic) IBOutlet UIView *cancel;
@property (weak, nonatomic) IBOutlet UIButton *cancel_btn;
@property (weak, nonatomic) IBOutlet UIView *contentV;

@property (strong, nonatomic) UIView *tagView;

@end



@implementation UIAlertSheetViewController
@dynamic title;

- (instancetype)init {
    UIAlertSheetViewController * instance = [[UIStoryboard storyboardWithName:@"UIAlertSheetViewController" bundle:nil] instantiateInitialViewController];
    [instance setModalTransitionStyle:UIModalTransitionStyleCrossDissolve];
    instance.modalPresentationStyle = UIModalPresentationOverFullScreen;
    return instance;
}

- (IBAction)dimiss:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

-(void)addAction:(UIAlertSheetAction *)action{
    
    if (action.style  == UIAlertSheetActionStyleCancel) {
        [self.cancel setHidden: NO];
        [self.cancel_btn setTitle:action.title forState:UIControlStateNormal];
    }else{
        self.tagView = [self addView:action];
        [self.contentV addSubview:self.tagView];
        self.contentLatoutH.constant = CGRectGetMaxY(self.tagView.frame);
    }
}

-(UIView *)addView:(UIAlertSheetAction *)action{
    float y = CGRectGetMaxY(self.tagView.frame) > 0 ? CGRectGetMaxY(self.tagView.frame) + 1 : 0;
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, y, self.view.bounds.size.width, 50)];
    view.backgroundColor = [UIColor whiteColor];
    
    BlockButton * button = [BlockButton buttonWithType:UIButtonTypeCustom];
    button.frame = view.bounds;
    //设置常规标题
    [button setTitle:action.title forState:UIControlStateNormal];//23,31,36
    if (action.style  == UIAlertSheetActionStyleDefault) {
        [button setTitleColor:[UIColor colorWithRed:23/255.0 green:31/255.0 blue:36/255.0 alpha:1] forState:UIControlStateNormal];
    }else{
        [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    }
    button.block = ^(UIButton * button) {
        action.handler(action);
        [self dimiss:nil];
    };
    //设置button上的字体大小
    button.titleLabel.font=[UIFont systemFontOfSize:16];
    [view addSubview:button];
    return view;
}

@end




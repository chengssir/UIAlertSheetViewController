//
//  UIAlertSheetViewController.h
//  推荐
//
//  Created by 国帅 on 2019/3/11.
//  Copyright © 2019 asi. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, UIAlertSheetActionStyle) {
    UIAlertSheetActionStyleDefault = 0,
    UIAlertSheetActionStyleCancel,
    UIAlertSheetActionStyleDestructive
};


@interface UIAlertSheetAction : NSObject

@property (nullable, nonatomic, readonly) NSString *title;
@property (nonatomic, assign ,readonly) UIAlertSheetActionStyle style;

+ (instancetype)actionWithTitle:(nullable NSString *)title style:(UIAlertSheetActionStyle)style handler:(void (^ __nullable)(UIAlertSheetAction *action))handler;
@end


@interface UIAlertSheetViewController : UIViewController

//暂不支持
//+ (instancetype)alertControllerWithTitle:(nullable NSString *)title message:(nullable NSString *)message;

- (void)addAction:(UIAlertSheetAction *)action;

@end

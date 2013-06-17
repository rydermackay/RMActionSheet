//
//  RMAlertView.h
//  RMActionSheet
//
//  Created by Ryder Mackay on 12-01-30.
//  Copyright (c) 2012 Ryder Mackay. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^RMAlertViewActionBlock)();
typedef void (^RMAlertViewAnimationBlock)(UIAlertView *alertView);

@interface RMAlertView : UIAlertView

@property (nonatomic, copy) RMAlertViewAnimationBlock willPresentBlock;
@property (nonatomic, copy) RMAlertViewAnimationBlock didPresentBlock;

@property (nonatomic, copy) RMAlertViewAnimationBlock willDismissBlock;
@property (nonatomic, copy) RMAlertViewAnimationBlock didDismissBlock;

@property (nonatomic, copy) RMAlertViewActionBlock cancelAction;

+ (instancetype)alertView;
+ (instancetype)alertViewWithTitle:(NSString *)title message:(NSString *)message;

- (id)initWithTitle:(NSString *)title message:(NSString *)message;

- (void)addButtonWithTitle:(NSString *)title action:(RMAlertViewActionBlock)action;
- (void)addCancelButtonWithTitle:(NSString *)title action:(RMAlertViewActionBlock)action;

- (void)setWillPresentAnimation:(RMAlertViewAnimationBlock)animation completion:(RMAlertViewAnimationBlock)completion;
- (void)setWillDismissAnimation:(RMAlertViewAnimationBlock)animation completion:(RMAlertViewAnimationBlock)completion;

@end

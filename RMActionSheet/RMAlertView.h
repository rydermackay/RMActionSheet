//
//  RMAlertView.h
//  RMActionSheet
//
//  Created by Ryder Mackay on 12-01-30.
//  Copyright (c) 2012 Endloop Mobile. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RMAlertView;

typedef void (^RMAlertViewActionBlock)();
typedef void (^RMAlertViewAnimationBlock)(UIAlertView *alertView);

@interface RMAlertView : UIAlertView <UIAlertViewDelegate>
{
    NSMutableArray *actionBlocks;
}

@property (nonatomic, copy) RMAlertViewAnimationBlock willPresentBlock;
@property (nonatomic, copy) RMAlertViewAnimationBlock didPresentBlock;

@property (nonatomic, copy) RMAlertViewAnimationBlock willDismissBlock;
@property (nonatomic, copy) RMAlertViewAnimationBlock didDismissBlock;

@property (nonatomic, copy) RMAlertViewActionBlock cancelAction;

+ (id)alertView;
+ (id)alertViewWithTitle:(NSString *)title message:(NSString *)message;

- (id)initWithTitle:(NSString *)title message:(NSString *)message;

- (void)addButtonWithTitle:(NSString *)title action:(RMAlertViewActionBlock)action;
- (void)addCancelButtonWithTitle:(NSString *)title action:(RMAlertViewActionBlock)action;

- (void)setWillPresentAnimation:(RMAlertViewAnimationBlock)animation completion:(RMAlertViewAnimationBlock)completion;
- (void)setWillDismissAnimation:(RMAlertViewAnimationBlock)animation completion:(RMAlertViewAnimationBlock)completion;

@end

//
//  RMActionSheet.h
//  RMActionSheet
//
//  Created by Ryder Mackay on 12-01-14.
//  Copyright (c) 2012 Endloop Mobile. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RMActionSheet;

typedef void (^RMActionSheetBlock)();
typedef void (^RMActionSheetAnimationBlock)(UIActionSheet *actionSheet);

@interface RMActionSheet : UIActionSheet <UIActionSheetDelegate> {
    NSMutableArray *actionBlocks;
}

@property (nonatomic, copy) RMActionSheetAnimationBlock willPresentBlock;
@property (nonatomic, copy) RMActionSheetAnimationBlock didPresentBlock;

@property (nonatomic, copy) RMActionSheetAnimationBlock willDismissBlock;
@property (nonatomic, copy) RMActionSheetAnimationBlock didDismissBlock;

@property (nonatomic, copy) RMActionSheetBlock cancelAction;

+ (id)actionSheet;
+ (id)actionSheetWithTitle:(NSString *)title;

- (id)initWithTitle:(NSString *)title;

- (void)addButtonWithTitle:(NSString *)title action:(RMActionSheetBlock)action;
- (void)addCancelButtonWithTitle:(NSString *)title action:(RMActionSheetBlock)action;
- (void)addDestructiveButtonWithTitle:(NSString *)title action:(RMActionSheetBlock)action;

- (void)setWillPresentAnimation:(RMActionSheetAnimationBlock)animation completion:(RMActionSheetAnimationBlock)completion;
- (void)setWillDismissAnimation:(RMActionSheetAnimationBlock)animation completion:(RMActionSheetAnimationBlock)completion;

@end

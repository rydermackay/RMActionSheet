//
//  RMAlertView.m
//  RMActionSheet
//
//  Created by Ryder Mackay on 12-01-30.
//  Copyright (c) 2012 Ryder Mackay. All rights reserved.
//

#import "RMAlertView.h"

@interface RMAlertView () <UIAlertViewDelegate>
@property (nonatomic, strong) NSMutableArray *actionBlocks;
@end

@implementation RMAlertView

+ (instancetype)alertView
{
    return [self alertViewWithTitle:nil message:nil];
}

+ (instancetype)alertViewWithTitle:(NSString *)title
                 message:(NSString *)message
{
    return [[self alloc] initWithTitle:title message:message];
}

- (id)initWithTitle:(NSString *)title message:(NSString *)message
{
    return [self initWithTitle:title
                       message:message
                      delegate:self
             cancelButtonTitle:nil
             otherButtonTitles:nil];
}

- (id)initWithTitle:(NSString *)title
            message:(NSString *)message
           delegate:(id)delegate
  cancelButtonTitle:(NSString *)cancelButtonTitle
  otherButtonTitles:(NSString *)otherButtonTitles, ...
{
    if (self = [super initWithTitle:title
                            message:message
                           delegate:self
                  cancelButtonTitle:cancelButtonTitle
                  otherButtonTitles:otherButtonTitles, nil]) {
        _actionBlocks = [NSMutableArray new];
    }
    
    return self;
}

#pragma mark - Action setters

- (void)addButtonWithTitle:(NSString *)title action:(RMAlertViewActionBlock)action
{
    [self addButtonWithTitle:title];
    
    id object = action ? [action copy] : [NSNull null];
    
    [self.actionBlocks addObject:object];
}

- (void)addCancelButtonWithTitle:(NSString *)title action:(RMAlertViewActionBlock)action
{
    [self addButtonWithTitle:title action:action];
    self.cancelButtonIndex = self.numberOfButtons - 1;
}

- (void)setWillPresentAnimation:(RMAlertViewAnimationBlock)animation completion:(RMAlertViewAnimationBlock)completion
{
    self.willPresentBlock = animation;
    self.didPresentBlock = completion;
}

- (void)setWillDismissAnimation:(RMAlertViewAnimationBlock)animation completion:(RMAlertViewAnimationBlock)completion
{
    self.willDismissBlock = animation;
    self.didDismissBlock = completion;
}

#pragma mark - UIAlertViewDelegate methods

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    RMAlertViewActionBlock block = self.actionBlocks[buttonIndex];
    
    if ((block != nil) && ([block isEqual:[NSNull null]] == NO))
        block();
}

- (void)willPresentAlertView:(UIAlertView *)alertView
{
    if (self.willPresentBlock)
        self.willPresentBlock(alertView);
}

- (void)didPresentAlertView:(UIAlertView *)alertView
{
    if (self.didPresentBlock)
        self.didPresentBlock(alertView);
}

- (void)alertView:(UIAlertView *)alertView willDismissWithButtonIndex:(NSInteger)buttonIndex
{
    if (self.willDismissBlock)
        self.willDismissBlock(alertView);
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    if (self.didDismissBlock)
        self.didDismissBlock(alertView);
}

- (void)alertViewCancel:(UIAlertView *)alertView
{
    if (self.cancelAction)
        self.cancelAction();
    else
        [self dismissWithClickedButtonIndex:self.cancelButtonIndex animated:YES];
}

- (BOOL)alertViewShouldEnableFirstOtherButton:(UIAlertView *)alertView
{
    return YES;
}

@end

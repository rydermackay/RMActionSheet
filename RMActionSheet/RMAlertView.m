//
//  RMAlertView.m
//  RMActionSheet
//
//  Created by Ryder Mackay on 12-01-30.
//  Copyright (c) 2012 Endloop Mobile. All rights reserved.
//

#import "RMAlertView.h"

@implementation RMAlertView

@synthesize willPresentBlock;
@synthesize didPresentBlock;

@synthesize willDismissBlock;
@synthesize didDismissBlock;

@synthesize cancelAction;

+ (id)alertView
{
    return [[self class] alertViewWithTitle:nil message:nil];
}

+ (id)alertViewWithTitle:(NSString *)title
                 message:(NSString *)message
{
    return [[[self class] alloc] initWithTitle:title message:message];
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
                  otherButtonTitles:otherButtonTitles, nil])
    {
        actionBlocks = [NSMutableArray array];
    }
    
    return self;
}

#pragma mark - Action setters

- (void)addButtonWithTitle:(NSString *)title action:(RMAlertViewActionBlock)action
{
    [self addButtonWithTitle:title];
    
    id object = (action != nil) ? [action copy] : [NSNull null];
    
    [actionBlocks addObject:object];
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
    RMAlertViewActionBlock block = [actionBlocks objectAtIndex:buttonIndex];
    
    if ((block != nil) && ([block isEqual:[NSNull null]] == NO))
    {
        block();
    }
}

- (void)willPresentAlertView:(UIAlertView *)alertView
{
    if (self.willPresentBlock != nil)
    {
        self.willPresentBlock(alertView);
    }
}

- (void)didPresentAlertView:(UIAlertView *)alertView
{
    if (self.didPresentBlock != nil)
    {
        self.didPresentBlock(alertView);
    }
}

- (void)alertView:(UIAlertView *)alertView willDismissWithButtonIndex:(NSInteger)buttonIndex
{
    if (self.willDismissBlock != nil)
    {
        self.willDismissBlock(alertView);
    }
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    if (self.didDismissBlock != nil)
    {
        self.didDismissBlock(alertView);
    }
}

- (void)alertViewCancel:(UIAlertView *)alertView
{
    if (self.cancelAction != nil)
    {
        self.cancelAction();
    }
    else
    {
        [self dismissWithClickedButtonIndex:self.cancelButtonIndex animated:YES];
    }
}

- (BOOL)alertViewShouldEnableFirstOtherButton:(UIAlertView *)alertView
{
    return YES;
}

@end

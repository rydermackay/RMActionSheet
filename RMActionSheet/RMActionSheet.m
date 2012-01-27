//
//  RMActionSheet.m
//  RMActionSheet
//
//  Created by Ryder Mackay on 12-01-14.
//  Copyright (c) 2012 Endloop Mobile. All rights reserved.
//

#import "RMActionSheet.h"

@implementation RMActionSheet

@synthesize willPresentBlock;
@synthesize didPresentBlock;

@synthesize willDismissBlock;
@synthesize didDismissBlock;

@synthesize cancelAction;

+ (id)actionSheet
{
    return [self actionSheetWithTitle:nil];
}

+ (id)actionSheetWithTitle:(NSString *)title
{
    return [[[self class] alloc] initWithTitle:title];
}

- (id)init
{
    return [self initWithTitle:nil];
}

- (id)initWithTitle:(NSString *)title
{
    return [self initWithTitle:title
                      delegate:nil
             cancelButtonTitle:nil
        destructiveButtonTitle:nil
             otherButtonTitles:nil];
}

- (id)initWithTitle:(NSString *)title
           delegate:(id<UIActionSheetDelegate>)delegate
  cancelButtonTitle:(NSString *)cancelButtonTitle
destructiveButtonTitle:(NSString *)destructiveButtonTitle
  otherButtonTitles:(NSString *)otherButtonTitles, ...
{
    if (self = [super initWithTitle:title
                           delegate:self
                  cancelButtonTitle:cancelButtonTitle
             destructiveButtonTitle:destructiveButtonTitle
                  otherButtonTitles:otherButtonTitles, nil])
    {
        actionBlocks = [NSMutableArray new];
    }
    
    return self;
}

- (void)addButtonWithTitle:(NSString *)title action:(RMActionSheetBlock)action
{
    [super addButtonWithTitle:title];
    
    id object = (action != nil) ? [action copy] : [NSNull null];
    
    [actionBlocks addObject:object];
}

- (void)addCancelButtonWithTitle:(NSString *)title action:(RMActionSheetBlock)action
{
    [self addButtonWithTitle:title action:action];
    self.cancelButtonIndex = self.numberOfButtons - 1;
}

- (void)addDestructiveButtonWithTitle:(NSString *)title action:(RMActionSheetBlock)action
{
    [self addButtonWithTitle:title action:action];
    self.destructiveButtonIndex = self.numberOfButtons - 1;
}

- (void)setWillPresentAnimation:(RMActionSheetAnimationBlock)animation completion:(RMActionSheetAnimationBlock)completion
{
    self.willPresentBlock = animation;
    self.didPresentBlock = completion;
}

- (void)setWillDismissAnimation:(RMActionSheetAnimationBlock)animation completion:(RMActionSheetAnimationBlock)completion
{
    self.willDismissBlock = animation;
    self.didDismissBlock = completion;
}

#pragma mark - UIActionSheetDelegate methods

- (void)willPresentActionSheet:(UIActionSheet *)actionSheet
{
    if (self.willPresentBlock != nil)
    {
        self.willPresentBlock(actionSheet);
    }
}

- (void)didPresentActionSheet:(UIActionSheet *)actionSheet
{
    if (self.didPresentBlock != nil)
    {
        self.didPresentBlock(actionSheet);
    }
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    RMActionSheetBlock block = [actionBlocks objectAtIndex:buttonIndex];
    
    if ((block != nil) && ([block isEqual:[NSNull null]] == NO))
    {
        block();
    }
}

- (void)actionSheetCancel:(UIActionSheet *)actionSheet
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

- (void)actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    if (self.didDismissBlock != nil)
    {
        self.didDismissBlock(actionSheet);
    }
}

- (void)actionSheet:(UIActionSheet *)actionSheet willDismissWithButtonIndex:(NSInteger)buttonIndex
{
    if (self.willDismissBlock != nil)
    {
        self.willDismissBlock(actionSheet);
    }
}

@end

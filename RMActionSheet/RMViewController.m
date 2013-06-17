//
//  RMViewController.m
//  RMActionSheet
//
//  Created by Ryder Mackay on 12-01-14.
//  Copyright (c) 2012 Ryder Mackay. All rights reserved.
//

#import "RMViewController.h"
#import "RMActionSheet.h"
#import "RMAlertView.h"

@implementation RMViewController

- (IBAction)actionButtonTapped:(id)sender
{
    RMActionSheet *actionSheet = [RMActionSheet actionSheet];
    
    
    [actionSheet addDestructiveButtonWithTitle:@"Destroy"
                                        action:^{
                                            NSLog(@"Destroy");
                                        }];
    
    [actionSheet addButtonWithTitle:@"Button 1"
                             action:^{
                                 NSLog(@"tapped button 1");
                             }];
    
    [actionSheet addButtonWithTitle:@"Button 2"
                             action:^{
                                 NSLog(@"tapped button 2");
                             }];
    
    [actionSheet addCancelButtonWithTitle:@"Cancel"
                                   action:nil];
    
    [actionSheet setWillPresentAnimation:^(UIActionSheet *actionSheet){
        NSLog(@"Starting present animation!");
    }
                              completion:^(UIActionSheet *actionSheet) {
                                  NSLog(@"Present complete!");
                              }];
    
    [actionSheet setWillDismissAnimation:^(UIActionSheet *actionSheet) {
        NSLog(@"Starting dismiss animation!");
    }
                              completion:^(UIActionSheet *actionSheet) {
                                  NSLog(@"Dismiss complete!");
                              }];
    
    [actionSheet showFromBarButtonItem:sender animated:YES];
    
}

- (IBAction)alertButtonTapped:(id)sender
{
    RMAlertView *alertView = [RMAlertView alertViewWithTitle:@"Alert!" message:nil];
    
    [alertView addButtonWithTitle:@"OK"
                           action:^{
                               NSLog(@"OK");
                           }];
    
    [alertView addButtonWithTitle:@"Not OK!"
                           action:^{
                               NSLog(@"Not OK!");
                           }];
    
    [alertView addCancelButtonWithTitle:@"Cancel"
                                 action:nil];
    
    [alertView setWillPresentAnimation:^(UIAlertView *alertView) {
        NSLog(@"Starting present animation!");
    }
                            completion:^(UIAlertView *alertView) {
                                NSLog(@"Present complete!");
                            }];
    
    [alertView setWillDismissAnimation:^(UIAlertView *alertView) {
        NSLog(@"Starting dismiss animation!");
    }
                            completion:^(UIAlertView *alertView) {
                                NSLog(@"Dismiss complete!");
                            }];
    
    [alertView show];
}

@end

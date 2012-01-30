//
//  RMViewController.m
//  RMActionSheet
//
//  Created by Ryder Mackay on 12-01-14.
//  Copyright (c) 2012 Endloop Mobile. All rights reserved.
//

#import "RMViewController.h"

#import "RMActionSheet.h"
#import "RMAlertView.h"

@implementation RMViewController

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

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

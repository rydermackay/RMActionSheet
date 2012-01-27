//
//  RMViewController.m
//  RMActionSheet
//
//  Created by Ryder Mackay on 12-01-14.
//  Copyright (c) 2012 Endloop Mobile. All rights reserved.
//

#import "RMViewController.h"

#import "RMActionSheet.h"

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
    RMActionSheet *actionSheet = [RMActionSheet actionSheetWithTitle:@"Sup?"];
    
    
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
    
    [actionSheet showFromBarButtonItem:sender animated:YES];
    
}

@end

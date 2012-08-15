# Introduction

`UIActionSheet` and `UIAlertView`are common interface elements for presenting the user with a choice or informing them of an abnormal situation. They’re simple to use, but it can be tiresome to implement the requisite delegate methods just to figure out which button was tapped.

`RMActionSheet` and `RMAlertView` are drop-in replacements for `UIActionSheet` and `UIAlertView` that use blocks instead of delegation. They provide just as much control as their UIKit counterparts without the headache sorting through various indexes and objects in a single delegate callback.

# Usage

These examples are fairly straightforward:

## RMActionSheet

    RMActionSheet *actionSheet = [RMActionSheet actionSheetWithTitle:@"Title"];
    
    [actionSheet addDestructiveButtonTitle:@"Destroy Foo"
                                    action:^{
                                        NSLog(@"foo destroyed");
                                    }];
    
    [actionSheet addButtonTitle:@"Bar"
                         action:^{
                             [self bar];
                         }];
    
    [actionSheet addCancelButtonTitle:@"Cancel"
                               action:NULL];
    
    [actionSheet showFromBarButtonItem:self.barButtonItem animated:YES];


## RMAlertView

    RMAlertView *alertView = [RMAlertView alertViewWithTitle:@"Title" message:@"Hey, weird something happened!"];
	[alertView addButtonTitle:@"OK"
                       action:^{
                           NSLog(@"OK");
                       }];
	[alertView addCancelButtonTitle:@"Cancel"
                             action:NULL];
	[alertView show];

## Animation Blocks

Since both `UIActionSheetDelegate` and `UIAlertViewDelegate` protocols define presentation callbacks, these subclasses support them:

	[alertView setWillPresentAnimation:^(id actionSheet){
		// do something with action sheet frame
	}
	completion:^(id actionSheet){
		NSLog(@"complete");
	}];

Alternatively, set the following properties directly:

	@property (nonatomic, copy) RMActionSheetAnimationBlock willPresentBlock;
	@property (nonatomic, copy) RMActionSheetAnimationBlock didPresentBlock;
	
	@property (nonatomic, copy) RMActionSheetAnimationBlock willDismissBlock;
	@property (nonatomic, copy) RMActionSheetAnimationBlock didDismissBlock;

## Cancel Block

Finally, the following block is invoked if the action sheet or alert view is cancelled by the system:

	@property (nonatomic, copy) RMActionSheetBlock cancelAction;

# Credits
`RMActionSheet` is brought to you by [Ryder Mackay](http://rydermackay.com) and is free to use. Feedback and contributions are welcome.
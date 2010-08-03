//
//  TestSlideMessageViewViewController.m
//  TestSlideMessageView
//
//  Created by cwiles on 6/21/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "TestSlideMessageViewViewController.h"

@implementation TestSlideMessageViewViewController

@synthesize presentButton;

- (void)notifySlideMessageView:(NSNotification *)notification {
  [self slideMessageView:[[notification userInfo] valueForKey:@"label"] msg:[[notification userInfo] valueForKey:@"message"]];
}

- (void)slideMessageView:(NSString *)label msg:(NSString *)viewMsg {
  
  SlideMessageView *msgView = [[SlideMessageView alloc] initWithFrame:CGRectMake(0, -100, self.view.frame.size.width, 100)];
  
  msgView.heading  = label;
  msgView.msgLabel = viewMsg;
  msgView.tag      = 9999;
  
  [self.view addSubview:msgView];
  
  [msgView showMsgWithDelay:2];
  
  [msgView release];
}

- (IBAction)presentController:(id)sender {

  ModalViewController *modal = [[ModalViewController alloc] initWithNibName:@"ModalView" bundle:nil];
  UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:modal];
  
  [self presentModalViewController:nav animated:YES];
  
  [nav release];
  [modal release];
}

- (void)viewWillAppear:(BOOL)animated {
  [[NSNotificationCenter defaultCenter] addObserver:self
                                           selector:@selector(notifySlideMessageView:)
                                               name:@"SlideMessageViewNotification"
                                             object:nil];
  [super viewWillAppear:YES];
}

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
  [presentButton release];
  [super dealloc];
}

@end

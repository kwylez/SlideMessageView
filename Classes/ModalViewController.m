    //
//  ModalViewController.m
//  SlideViewModalExample
//
//  Created by cwiles on 6/21/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "ModalViewController.h"


@implementation ModalViewController



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {

  self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave
                                                                                         target:self 
                                                                                         action:@selector(dismiss)];
  [super viewDidLoad];
}



- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}

- (void)dismiss {

  NSDictionary *notficationDict = [NSDictionary dictionaryWithObjectsAndKeys: @"custom label", @"label", @"Custom message", @"message", nil];
  
  [[NSNotificationCenter defaultCenter] postNotificationName:@"SlideMessageViewNotification"
                                                      object:nil
                                                    userInfo:notficationDict];
  [self dismissModalViewControllerAnimated:YES];
}

@end

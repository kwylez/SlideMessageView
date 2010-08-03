//
//  TestSlideMessageViewViewController.h
//  TestSlideMessageView
//
//  Created by cwiles on 6/21/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ModalViewController.h"
#import "SlideMessageView.h"

@interface TestSlideMessageViewViewController : UIViewController {
  UIButton *presentButton;
}

@property (nonatomic, retain) IBOutlet UIButton *presentButton;

- (void)slideMessageView:(NSString *)label msg:(NSString *)viewMsg;
- (void)notifySlideMessageView:(NSNotification *)nofication;
- (IBAction)presentController:(id)sender;

@end


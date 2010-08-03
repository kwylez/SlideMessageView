//
//  TestSlideMessageViewAppDelegate.h
//  TestSlideMessageView
//
//  Created by cwiles on 6/21/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TestSlideMessageViewViewController;

@interface TestSlideMessageViewAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    TestSlideMessageViewViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet TestSlideMessageViewViewController *viewController;

@end


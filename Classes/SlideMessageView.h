//
//  SlideMessageView.h
//  StjudeConnect
//
//  Created by cwiles on 8/5/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface SlideMessageView : UIView {
  NSString   *heading;              
  NSString   *msgLabel; 
}

@property (nonatomic, retain) NSString *heading;
@property (nonatomic, retain) NSString *msgLabel;

- (void)showMsgWithDelay:(int)delay;

@end

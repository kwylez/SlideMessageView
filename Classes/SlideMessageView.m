//
//  SlideMessageView.m
//  StjudeConnect
//
//  Created by cwiles on 8/5/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "SlideMessageView.h"

/*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 * Private interface definitions
 *~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/
@interface SlideMessageView(private)
- (void)hideMsg;
@end

@implementation SlideMessageView
@synthesize heading;
@synthesize msgLabel;

/**************************************************************************
 *
 * Private implementation section
 *
 **************************************************************************/

#pragma mark -
#pragma mark Private Methods

/*-------------------------------------------------------------
 *
 *------------------------------------------------------------*/
- (void)hideMsg {
  // Slide the view down off screen
  CGRect frame = self.frame;
  
  [UIView beginAnimations:nil context:NULL];
  [UIView setAnimationDuration:.75];
  
  frame.origin.y = self.bounds.origin.y - 100;
  self.frame = frame;
  
  [UIView commitAnimations];
}

- (id)initWithFrame:(CGRect)frame {
  
  if (self = [super initWithFrame:frame]) {
    self.opaque          = YES;
    self.alpha           = .95;
    self.backgroundColor = [UIColor blackColor];
    
  }
  
  return self;
}

- (void)drawRect:(CGRect)rect {
  
	// Color and font for the main text items
	UIColor *mainTextColor = nil;
	UIFont *mainFont       = [UIFont boldSystemFontOfSize:25.0];
  
	// Color and font for the secondary text items (GMT offset, day)
	UIColor *secondaryTextColor = nil;
	UIFont *secondaryFont       = [UIFont systemFontOfSize:15.0];
  
  mainTextColor        = [UIColor whiteColor];
  secondaryTextColor   = [UIColor whiteColor];
  
  CGRect contentRect   = self.bounds;
  CGFloat boundsX      = contentRect.origin.x;
  NSInteger labelWidth = contentRect.size.width;
  CGPoint point;
  
  // Set the color for the main text items.
  [mainTextColor set];
  
  point = CGPointMake(boundsX, 0);
  [self.heading drawAtPoint:point forWidth:labelWidth withFont:mainFont minFontSize:12.0 actualFontSize:NULL lineBreakMode:UILineBreakModeTailTruncation baselineAdjustment:UIBaselineAdjustmentAlignBaselines];
  
  point = CGPointMake(boundsX, 30);
  [self.msgLabel drawAtPoint:point forWidth:(labelWidth - 10) withFont:secondaryFont minFontSize:15.0 actualFontSize:NULL lineBreakMode:UILineBreakModeWordWrap baselineAdjustment:UIBaselineAdjustmentAlignBaselines];
  
  // Set the color for the secondary text items.
  [secondaryTextColor set];
}


- (void)dealloc {
  [heading release];
  [msgLabel release]; 
  [super dealloc];
}

/**************************************************************************
 *
 * Class implementation section
 *
 **************************************************************************/


#pragma mark -
#pragma mark Message Handling

/*-------------------------------------------------------------
 *
 *------------------------------------------------------------*/
- (void)showMsgWithDelay:(int)delay {
  
  CGRect frame = self.frame;
  
  [UIView beginAnimations:nil context:NULL];
  [UIView setAnimationDuration:1.0];
  
  // Slide up based on y axis
  // A better solution over a hard-coded value would be to
  // determine the size of the title and msg labels and 
  // set this value accordingly
  frame.origin.y = 0;
  self.frame     = frame;
  
  [UIView commitAnimations];
  
  // Hide the view after the requested delay
  [self performSelector:@selector(hideMsg) withObject:nil afterDelay:delay];
  
}

@end

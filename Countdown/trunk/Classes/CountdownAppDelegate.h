//
//  CountdownAppDelegate.h
//  Countdown
//
//  Created by Daniel Gomes on 30/04/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CountdownViewController;

@interface CountdownAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    CountdownViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet CountdownViewController *viewController;

@end


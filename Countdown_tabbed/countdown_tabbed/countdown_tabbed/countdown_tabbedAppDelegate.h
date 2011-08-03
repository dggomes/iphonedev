//
//  Countdown_tabbedAppDelegate.h
//  Countdown_tabbed
//
//  Created by Daniel Gomes on 03/08/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Countdown_tabbedAppDelegate : NSObject <UIApplicationDelegate> {
    IBOutlet UITabBarController *tabBarController;
    
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UITabBarController *tabBarController;

@end

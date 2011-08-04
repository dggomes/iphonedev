//
//  FirstViewController.h
//  Countdown
//
//  Created by Daniel Gomes on 03/08/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface FirstViewController : UIViewController {
    IBOutlet UILabel *currentDateLabel;
    
}

@property (retain, nonatomic) IBOutlet UILabel *currentDateLabel;

- (IBAction) showDate:(id)sender;

@end

//
//  CountdownViewController.h
//  Countdown
//
//  Created by Daniel Gomes on 30/04/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CountdownViewController : UIViewController {

	IBOutlet UIButton *startCountdown;
	IBOutlet UIImageView *bg;
//	IBOutlet UILabel *label1;
    
}

@property (retain, nonatomic) IBOutlet UIButton *startCountdown;
@property (retain, nonatomic) IBOutlet UIImageView *bg;
// @property (retain, nonatomic) IBOutlet UILabel *label1;

 -(IBAction)doAlert:(id)sender;

@end

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
    IBOutlet UITextField *userInputCountdownDate;
    IBOutlet UITextField *userInputCountdownTime;
    IBOutlet UILabel *currentDateLabel;
    IBOutlet UILabel *countdownDateLabel;

}

@property (retain, nonatomic) IBOutlet UIButton *startCountdown;
@property (retain, nonatomic) IBOutlet UIImageView *bg;
@property (retain, nonatomic) IBOutlet UITextField *userInputCountdownDate;
@property (retain, nonatomic) IBOutlet UITextField *userInputCountdownTime;
@property (retain, nonatomic) IBOutlet UILabel *currentDateLabel;
@property (retain, nonatomic) IBOutlet UILabel *countdownDateLabel;

-(IBAction)doAlert:(id)sender;
- (IBAction) hideKeyboard:(id)sender;

@end

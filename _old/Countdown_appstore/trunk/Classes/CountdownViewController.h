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
    IBOutlet UILabel *displayLabelYears;
    IBOutlet UILabel *displayLabelMonths;
    IBOutlet UILabel *displayLabelDays;
    IBOutlet UILabel *displayLabelHours;
    IBOutlet UILabel *displayLabelMinutes;    
    IBOutlet UILabel *displayLabelSeconds;    
    IBOutlet UIImageView *img_years;
}

@property (retain, nonatomic) IBOutlet UIButton *startCountdown;
@property (retain, nonatomic) IBOutlet UIImageView *bg;
@property (retain, nonatomic) IBOutlet UITextField *userInputCountdownDate;
@property (retain, nonatomic) IBOutlet UITextField *userInputCountdownTime;
@property (retain, nonatomic) IBOutlet UILabel *currentDateLabel;
@property (retain, nonatomic) IBOutlet UILabel *countdownDateLabel;
@property (retain, nonatomic) IBOutlet UILabel *displayLabelYears;
@property (retain, nonatomic) IBOutlet UILabel *displayLabelMonths;
@property (retain, nonatomic) IBOutlet UILabel *displayLabelDays;
@property (retain, nonatomic) IBOutlet UILabel *displayLabelHours;
@property (retain, nonatomic) IBOutlet UILabel *displayLabelMinutes;
@property (retain, nonatomic) IBOutlet UILabel *displayLabelSeconds;
@property (retain, nonatomic) IBOutlet UIImageView *img_years;

- (IBAction) showDate:(id)sender;

@end

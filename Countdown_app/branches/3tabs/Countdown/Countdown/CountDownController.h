//
//  CountDownController.h
//  Countdown
//
//  Created by Daniel Gomes on 03/08/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface CountDownController : UIViewController {

    IBOutlet UILabel *currentDateLabel;
    IBOutlet UILabel *countdownDateLabel;
    IBOutlet UILabel *displayLabelYears;
    IBOutlet UILabel *displayLabelMonths;
    IBOutlet UILabel *displayLabelDays;
    IBOutlet UILabel *displayLabelHours;
    IBOutlet UILabel *displayLabelMinutes;    
    IBOutlet UILabel *displayLabelSeconds;
    IBOutlet UILabel *labelYears;
    IBOutlet UILabel *labelMonths;
    IBOutlet UILabel *labelDays;
    IBOutlet UILabel *labelHours;
    IBOutlet UILabel *labelMinutes;    
    IBOutlet UILabel *labelSeconds;  
}

@property (retain, nonatomic) IBOutlet UILabel *currentDateLabel;
@property (retain, nonatomic) IBOutlet UILabel *countdownDateLabel;
@property (retain, nonatomic) IBOutlet UILabel *displayLabelYears;
@property (retain, nonatomic) IBOutlet UILabel *displayLabelMonths;
@property (retain, nonatomic) IBOutlet UILabel *displayLabelDays;
@property (retain, nonatomic) IBOutlet UILabel *displayLabelHours;
@property (retain, nonatomic) IBOutlet UILabel *displayLabelMinutes;
@property (retain, nonatomic) IBOutlet UILabel *displayLabelSeconds;
@property (retain, nonatomic) IBOutlet UILabel *labelYears;
@property (retain, nonatomic) IBOutlet UILabel *labelMonths;
@property (retain, nonatomic) IBOutlet UILabel *labelDays;
@property (retain, nonatomic) IBOutlet UILabel *labelHours;
@property (retain, nonatomic) IBOutlet UILabel *labelMinutes;
@property (retain, nonatomic) IBOutlet UILabel *labelSeconds;

@end

//
//  ViewController.h
//  LondonMarathon
//
//  Created by Daniel Gomes on 04/04/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController {

IBOutlet UILabel *currentDateLabel;
IBOutlet UILabel *countdownDateLabel;
IBOutlet UILabel *displayLabelDays;
IBOutlet UILabel *displayLabelHours;
IBOutlet UILabel *displayLabelMinutes;    
IBOutlet UILabel *displayLabelSeconds;
IBOutlet UILabel *labelDays;
IBOutlet UILabel *labelHours;
IBOutlet UILabel *labelMinutes;    
IBOutlet UILabel *labelSeconds;  
    

}

@property (retain, nonatomic) IBOutlet UILabel *currentDateLabel;
@property (retain, nonatomic) IBOutlet UILabel *countdownDateLabel;
@property (retain, nonatomic) IBOutlet UILabel *displayLabelDays;
@property (retain, nonatomic) IBOutlet UILabel *displayLabelHours;
@property (retain, nonatomic) IBOutlet UILabel *displayLabelMinutes;
@property (retain, nonatomic) IBOutlet UILabel *displayLabelSeconds;
@property (retain, nonatomic) IBOutlet UILabel *labelDays;
@property (retain, nonatomic) IBOutlet UILabel *labelHours;
@property (retain, nonatomic) IBOutlet UILabel *labelMinutes;
@property (retain, nonatomic) IBOutlet UILabel *labelSeconds;

    -(IBAction)donate;
    -(IBAction)visitSite;

@end

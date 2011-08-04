//
//  SecondViewController.m
//  Countdown
//
//  Created by Daniel Gomes on 03/08/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "SecondViewController.h"

@implementation SecondViewController
@synthesize currentDateLabel;
@synthesize countdownDateLabel;
@synthesize displayLabelYears;
@synthesize displayLabelMonths;
@synthesize displayLabelDays;
@synthesize displayLabelHours;
@synthesize displayLabelMinutes;
@synthesize displayLabelSeconds;


/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
}
*/

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

-(void)viewWillAppear:(BOOL)animated{
    
    // retrieving timetoGo
    
    int *timetoGoYears = [[NSUserDefaults standardUserDefaults] objectForKey:@"timetoGoYears"];
    
    int *timetoGoMonths = [[NSUserDefaults standardUserDefaults] objectForKey:@"timetoGoMonths"];
    
    int *timetoGoDays = [[NSUserDefaults standardUserDefaults] objectForKey:@"timetoGoDays"];
    
    int *timetoGoHours = [[NSUserDefaults standardUserDefaults] objectForKey:@"timetoGoHours"];
    
    int *timetoGoMinutes = [[NSUserDefaults standardUserDefaults] objectForKey:@"timetoGoMinutes"];
    
    int *timetoGoSeconds = [[NSUserDefaults standardUserDefaults] objectForKey:@"timetoGoSeconds"];
    
    // creating messages
    
    NSString *messageYears = [NSString stringWithFormat:@"%02d years, ", timetoGo.year]; 
    NSString *messageMonths = [NSString stringWithFormat:@"%02d months, ", timetoGo.month];
    NSString *messageDays = [NSString stringWithFormat:@"%02d days, ", timetoGo.day];
    NSString *messageHours = [NSString stringWithFormat:@"%02d hours, ", timetoGo.hour];
    NSString *messageMinutes = [NSString stringWithFormat:@"%02d minutes and ", timetoGo.minute];
    NSString *messageSeconds = [NSString stringWithFormat:@"%02d seconds, ", timetoGo.second];
    
    // switching the message
    
    switch (timetoGoYears) {
            
        case 1:  
            messageYears = [NSString stringWithFormat:@"%02d", timetoGo.year];
            //            img_years.hidden=YES;
            break;
            
        case 0:  
            messageYears = @"00 years";
            //            img_years.hidden=NO;
            break;
            
        default:
            messageYears = [NSString stringWithFormat:@"%02d", timetoGo.year];
            //            img_years.hidden=YES;
            break;
    }
    
    switch (timetoGoMonths) {
            
        case 1:  
            messageMonths = [NSString stringWithFormat:@"%02d", timetoGo.month];
            break;
            
        case 0:  
            messageMonths = @"00 months";
            break;
            
        default:
            messageMonths = [NSString stringWithFormat:@"%02d", timetoGo.month];
            break;
    }
    
    switch (timetoGoDays) {
            
        case 1:  
            messageDays = [NSString stringWithFormat:@"%02d", timetoGo.day];
            break;
            
        case 0:  
            messageDays = @"00 days";
            break;
            
        default:
            messageDays = [NSString stringWithFormat:@"%02d", timetoGo.day];
            break;
    }
    
    switch (timetoGoHours) {
            
        case 1:  
            messageHours = [NSString stringWithFormat:@"%02d", timetoGo.hour];
            break;
            
        case 0:  
            messageHours = @"00 hours";
            break;
            
        default:
            messageHours = [NSString stringWithFormat:@"%02d", timetoGo.hour];
            break;
    }
    
    switch (timetoGoMinutes) {
            
        case 1:  
            messageMinutes = [NSString stringWithFormat:@"%02d", timetoGo.minute];
            break;
            
        case 0:  
            messageMinutes = @"00 minutes";
            break;
            
        default:
            messageMinutes = [NSString stringWithFormat:@"%02d", timetoGo.minute];
            break;
            
    }
    
    switch (timetoGoSeconds) {
            
        case 1:  
            messageSeconds = [NSString stringWithFormat:@"%02d", timetoGo.second];
            break;
            
        case 0:  
            messageSeconds = @"00 seconds";
            break;
            
        default:
            messageSeconds = [NSString stringWithFormat:@"%02d", timetoGo.second];
            break;
    }
    
    // displaying message
    
    NSString *messageYearsDisplay = [NSString stringWithFormat:@"%@", messageYears];
    NSString *messageMonthsDisplay = [NSString stringWithFormat:@"%@", messageMonths];
    NSString *messageDaysDisplay = [NSString stringWithFormat:@"%@", messageDays]; 
    NSString *messageHoursDisplay = [NSString stringWithFormat:@"%@", messageHours]; 
    NSString *messageMinutesDisplay = [NSString stringWithFormat:@"%@", messageMinutes]; 
    NSString *messageSecondsDisplay = [NSString stringWithFormat:@"%@", messageSeconds];  
    
    
    NSString *currentDateString = [[NSUserDefaults standardUserDefaults] objectForKey:@"currentDateString"];
    
    NSString *countDownDateLabelSecondView = [[NSUserDefaults standardUserDefaults] objectForKey:@"countDownDatePickerString"];
    
    NSString *messageYearsDisplay = [[NSUserDefaults standardUserDefaults] objectForKey:@"messageYearsDisplay"];
    
    NSString *messageMonthsDisplay = [[NSUserDefaults standardUserDefaults] objectForKey:@"messageMonthsDisplay"];
    
    NSString *messageDaysDisplay = [[NSUserDefaults standardUserDefaults] objectForKey:@"messageDaysDisplay"];
    
    NSString *messageHoursDisplay = [[NSUserDefaults standardUserDefaults] objectForKey:@"messageHoursDisplay"];
    
    NSString *messageMinutesDisplay = [[NSUserDefaults standardUserDefaults] objectForKey:@"messageMinutesDisplay"];
    
    NSString *messageSecondsDisplay = [[NSUserDefaults standardUserDefaults] objectForKey:@"messageSecondsDisplay"];
    
    currentDateLabel.text=currentDateString;
    countdownDateLabel.text=countDownDateLabelSecondView;
    displayLabelYears.text=messageYearsDisplay;
    displayLabelMonths.text=messageMonthsDisplay;
    displayLabelDays.text=messageDaysDisplay;
    displayLabelHours.text=messageHoursDisplay;
    displayLabelMinutes.text=messageMinutesDisplay;
    displayLabelSeconds.text=messageSecondsDisplay;
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];

    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc
{
    [super dealloc];
}

@end

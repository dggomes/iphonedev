//
//  FirstViewController.m
//  Countdown
//
//  Created by Daniel Gomes on 03/08/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "FirstViewController.h"

@implementation FirstViewController
@synthesize currentDateLabel;

#pragma markstartofcode

-(IBAction) showDate:(id)sender{
    
	NSDate *currentDate = [NSDate date];
	NSDateFormatter *dateformat = [[NSDateFormatter alloc] init];
	[dateformat setDateFormat:@"dd/MM/yyyy hh:mm:ss a"];
    
    NSDateFormatter *dateformatToCompare = [[NSDateFormatter alloc] init];
    [dateformatToCompare setDateFormat:@"dd/MM/yyyy hh:mm a"];
    
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
	int unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
    
    NSString *currentDateString = [dateformat stringFromDate:currentDate];
    
    NSDate *countDownDatePicker = [sender date];
    NSString *countDownDatePickerString = [dateformat stringFromDate:countDownDatePicker];
    
    // storing strings
    
    [[NSUserDefaults standardUserDefaults] setObject:currentDateString forKey:@"currentDateString"];
    [[NSUserDefaults standardUserDefaults] setObject:countDownDatePickerString forKey:@"countDownDatePickerString"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    // calculating timetoGo    
    
	NSDateComponents *timetoGo = [gregorian components:unitFlags fromDate:currentDate toDate:countDownDatePicker options:0];
    
    int timetoGoYears = [timetoGo year];
    int timetoGoMonths = [timetoGo month];
    int timetoGoDays = [timetoGo day];
    int timetoGoHours = [timetoGo hour];
    int timetoGoMinutes = [timetoGo minute];
    int timetoGoSeconds = [timetoGo second];
    
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
    
    // storing messages
    
    [[NSUserDefaults standardUserDefaults] setObject:messageYearsDisplay forKey:@"messageYearsDisplay"];
    [[NSUserDefaults standardUserDefaults] setObject:messageMonthsDisplay forKey:@"messageMonthsDisplay"];
    [[NSUserDefaults standardUserDefaults] setObject:messageDaysDisplay forKey:@"messageDaysDisplay"];
    [[NSUserDefaults standardUserDefaults] setObject:messageHoursDisplay forKey:@"messageHoursDisplay"];
    [[NSUserDefaults standardUserDefaults] setObject:messageMinutesDisplay forKey:@"messageMinutesDisplay"];
    [[NSUserDefaults standardUserDefaults] setObject:messageSecondsDisplay forKey:@"messageSecondsDisplay"];
    
    [[NSUserDefaults standardUserDefaults] synchronize];

    [dateformat release];
    [dateformatToCompare release];
    [gregorian release];
    
}

#pragma mark endofcode

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

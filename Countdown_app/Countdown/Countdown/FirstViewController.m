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
    
    // storing timetoGo
    
    [[NSUserDefaults standardUserDefaults] setObject:timetoGoYears forKey:@"timetoGoYears"];
    [[NSUserDefaults standardUserDefaults] setObject:timetoGoMonths forKey:@"timetoGoMonths"];
    [[NSUserDefaults standardUserDefaults] setObject:timetoGoDays forKey:@"timetoGoDays"];
    [[NSUserDefaults standardUserDefaults] setObject:timetoGoHours forKey:@"timetoGoHours"];
    [[NSUserDefaults standardUserDefaults] setObject:timetoGoMinutes forKey:@"timetoGoMinutes"];
    [[NSUserDefaults standardUserDefaults] setObject:timetoGoSeconds forKey:@"timetoGoSeconds"];
    
    [[NSUserDefaults standardUserDefaults] synchronize];
    
   
/*    
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
    
 */
 
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

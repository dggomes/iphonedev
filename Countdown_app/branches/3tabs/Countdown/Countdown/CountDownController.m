//
//  CountDownController.m
//  Countdown
//
//  Created by Daniel Gomes on 03/08/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CountDownController.h"

@implementation CountDownController
@synthesize currentDateLabel;
@synthesize countdownDateLabel;
@synthesize displayLabelYears;
@synthesize displayLabelMonths;
@synthesize displayLabelDays;
@synthesize displayLabelHours;
@synthesize displayLabelMinutes;
@synthesize displayLabelSeconds;
@synthesize labelYears;
@synthesize labelMonths;
@synthesize labelDays;
@synthesize labelHours;
@synthesize labelMinutes;
@synthesize labelSeconds;

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
    
    NSString *currentDateString = [[NSUserDefaults standardUserDefaults] objectForKey:@"currentDateString"];
    
    NSString *inputDateTimeString = [[NSUserDefaults standardUserDefaults] objectForKey:@"inputDateTimeString"];
    
    NSString *messageYearsDisplay = [[NSUserDefaults standardUserDefaults] objectForKey:@"messageYearsDisplay"];
    
    NSString *messageMonthsDisplay = [[NSUserDefaults standardUserDefaults] objectForKey:@"messageMonthsDisplay"];
    
    NSString *messageDaysDisplay = [[NSUserDefaults standardUserDefaults] objectForKey:@"messageDaysDisplay"];
    
    NSString *messageHoursDisplay = [[NSUserDefaults standardUserDefaults] objectForKey:@"messageHoursDisplay"];
    
    NSString *messageMinutesDisplay = [[NSUserDefaults standardUserDefaults] objectForKey:@"messageMinutesDisplay"];
    
    NSString *messageSecondsDisplay = [[NSUserDefaults standardUserDefaults] objectForKey:@"messageSecondsDisplay"];
    
    NSString *labelYearsString = [[NSUserDefaults standardUserDefaults] objectForKey:@"labelYears"];
    NSString *labelMonthsString = [[NSUserDefaults standardUserDefaults] objectForKey:@"labelMonths"];
    NSString *labelDaysString = [[NSUserDefaults standardUserDefaults] objectForKey:@"labelDays"];
    NSString *labelHoursString = [[NSUserDefaults standardUserDefaults] objectForKey:@"labelHours"];
    NSString *labelMinutesString = [[NSUserDefaults standardUserDefaults] objectForKey:@"labelMinutes"];
    NSString *labelSecondsString = [[NSUserDefaults standardUserDefaults] objectForKey:@"labelSeconds"];
    
    currentDateLabel.text=currentDateString;
    countdownDateLabel.text=inputDateTimeString;
    displayLabelYears.text=messageYearsDisplay;
    displayLabelMonths.text=messageMonthsDisplay;
    displayLabelDays.text=messageDaysDisplay;
    displayLabelHours.text=messageHoursDisplay;
    displayLabelMinutes.text=messageMinutesDisplay;
    displayLabelSeconds.text=messageSecondsDisplay;
    labelYears.text=labelYearsString;
    labelMonths.text=labelMonthsString;
    labelDays.text=labelDaysString;
    labelHours.text=labelHoursString;
    labelMinutes.text=labelMinutesString;
    labelSeconds.text=labelSecondsString;
    
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

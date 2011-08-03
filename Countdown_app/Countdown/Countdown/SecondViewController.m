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

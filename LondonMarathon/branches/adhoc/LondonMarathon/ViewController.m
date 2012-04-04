//
//  ViewController.m
//  LondonMarathon
//
//  Created by Daniel Gomes on 04/04/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

@synthesize currentDateLabel;
@synthesize countdownDateLabel;
@synthesize displayLabelDays;
@synthesize displayLabelHours;
@synthesize displayLabelMinutes;
@synthesize displayLabelSeconds;
@synthesize labelDays;
@synthesize labelHours;
@synthesize labelMinutes;
@synthesize labelSeconds;

-(IBAction)donate;{

    NSURL *donate = [ [ NSURL alloc ] initWithString: @"http://uk.virginmoneygiving.com/fundraiser-web/fundraiser/showFundraiserProfilePage.action?userUrl=mikesnewlungs"];
    [[UIApplication sharedApplication] openURL:donate];
}

-(IBAction)visitSite;{
    
    NSURL *visitSite = [ [ NSURL alloc ] initWithString: @"http://www.newlungsfor.me.uk"];
    [[UIApplication sharedApplication] openURL:visitSite];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

-(void)countdown {
    
	// getting current date
    
    NSDate *currentDate = [NSDate date];
    
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"dateFormatted"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
	int unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
    
    NSDateFormatter *dateformat = [[NSDateFormatter alloc] init];
	[dateformat setDateFormat:@"dd/MM/yyyy hh:mm:ss a"];
    
//    NSString *currentDateString = [dateformat stringFromDate:currentDate];
    
    // fixing marathon day
    
    NSString *marathonDay = [[NSString alloc] initWithString:@"22/04/2012 9:45:00 AM"];
    
    // converting string to date
    
    NSDate *marathonDate = [dateformat dateFromString:marathonDay];
    
    // calculating timetoGo    
    
	NSDateComponents *timetoGo = [gregorian components:unitFlags fromDate:currentDate toDate:marathonDate options:0];
    
    int timetoGoDays = [timetoGo day];
    int timetoGoHours = [timetoGo hour];
    int timetoGoMinutes = [timetoGo minute];
    int timetoGoSeconds = [timetoGo second];
    
    // creating messages
    
    NSString *messageDays = [NSString stringWithFormat:@"%02d days, ", timetoGo.day];
    NSString *messageHours = [NSString stringWithFormat:@"%02d hours, ", timetoGo.hour];
    NSString *messageMinutes = [NSString stringWithFormat:@"%02d minutes and ", timetoGo.minute];
    NSString *messageSeconds = [NSString stringWithFormat:@"%02d seconds, ", timetoGo.second];
    
    // creating name labels
    
    NSString *labelDaysString = @"00";
    NSString *labelHoursString = @"00";
    NSString *labelMinutesString = @"00";
    NSString *labelSecondsString = @"00";
    
    // switching the message
    
    switch (timetoGoDays) {
            
        case 1:  
            messageDays = [NSString stringWithFormat:@"%02d", timetoGo.day];
            labelDaysString = @"day";
            break;
            
        default:
            messageDays = [NSString stringWithFormat:@"%02d", timetoGo.day];
            labelDaysString = @"days";
            break;
    }
    
    switch (timetoGoHours) {
            
        case 1:  
            messageHours = [NSString stringWithFormat:@"%02d", timetoGo.hour];
            labelHoursString = @"hour";
            break;
            
        default:
            messageHours = [NSString stringWithFormat:@"%02d", timetoGo.hour];
            labelHoursString = @"hours";
            break;
    }
    
    switch (timetoGoMinutes) {
            
        case 1:  
            messageMinutes = [NSString stringWithFormat:@"%02d", timetoGo.minute];
            labelMinutesString= @"min";
            break;
            
        default:
            messageMinutes = [NSString stringWithFormat:@"%02d", timetoGo.minute];
            labelMinutesString= @"mins";
            break;
            
    }
    
    switch (timetoGoSeconds) {
            
        case 1:  
            messageSeconds = [NSString stringWithFormat:@"%02d", timetoGo.second];
            labelSecondsString= @"sec";
            break;
            
        default:
            messageSeconds = [NSString stringWithFormat:@"%02d", timetoGo.second];
            labelSecondsString= @"secs";
            break;
    }


    
    // keeping label if smaller then 0
    
    if ((timetoGo.day < 0)){
        messageDays= @"00";
    }     

    if ((timetoGo.hour < 0)){
        messageHours= @"00";
    }    
    
    if ((timetoGo.minute < 0)){
        messageMinutes= @"00";
    }    
    
    if ((timetoGo.second < 0)){
        messageSeconds= @"00";
    }    
    
    else { }
     
    // printing labels
    
//    currentDateLabel.text=currentDateString;
//    countdownDateLabel.text=marathonDay;
    displayLabelDays.text=messageDays;
    displayLabelHours.text=messageHours;
    displayLabelMinutes.text=messageMinutes;
    displayLabelSeconds.text=messageSeconds;
    labelDays.text=labelDaysString;
    labelHours.text=labelHoursString;
    labelMinutes.text=labelMinutesString;
    labelSeconds.text=labelSecondsString;
}

- (void)viewDidLoad
{
    [displayLabelDays setFont:[UIFont fontWithName:@"League Gothic" size:70]];
    [displayLabelDays setTextAlignment:UITextAlignmentCenter];
    [displayLabelHours setFont:[UIFont fontWithName:@"League Gothic" size:70]];
    [displayLabelHours setTextAlignment:UITextAlignmentCenter];
    [displayLabelMinutes setFont:[UIFont fontWithName:@"League Gothic" size:70]];
    [displayLabelMinutes setTextAlignment:UITextAlignmentCenter];
    [displayLabelSeconds setFont:[UIFont fontWithName:@"League Gothic" size:70]];
    [displayLabelSeconds setTextAlignment:UITextAlignmentCenter];
    [super viewDidLoad];
    
    // Do any additional setup after loading the view, typically from a nib.

    [self countdown];
    [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(countdown) userInfo:nil repeats:YES];
}
    
- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(performAnimation:) name:UIApplicationDidBecomeActiveNotification object:nil];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
//    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIApplicationDidBecomeActiveNotification object:nil];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (void)dealloc {
    [NSCalendar dealloc];
    [NSDateComponents dealloc];
    [NSDateFormatter dealloc];
    [NSDate dealloc];
    [NSString dealloc];

}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end

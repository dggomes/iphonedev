//
//  TimeController.m
//  Countdown
//
//  Created by Daniel Gomes on 04/08/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "TimeController.h"


@implementation TimeController
@synthesize userInputTime;
@synthesize timePicker;

- (BOOL)textFieldShouldBeginEditing:

(UITextField *)userInputTime { 
    timePicker.hidden = NO; 
    return NO;
}

- (IBAction)dismissKeyboard:(id)sender {
    timePicker.hidden = YES;  
}

- (IBAction)dateChanged:(id)sender {
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"timeFormatted"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    NSDate *currentDate = [NSDate date];
    	
    NSDateFormatter *timeformat = [[NSDateFormatter alloc] init];
	[timeformat setDateFormat:@"hh:mm a"];
    
    UIDatePicker *picker = (UIDatePicker *)sender;
    NSDate *pickerTime = picker.date;
    
    NSString *timeFormatted = [timeformat stringFromDate:pickerTime];
    NSString *timeCheck = [NSString stringWithFormat:@"1"];
    
    [[NSUserDefaults standardUserDefaults] setObject:timeFormatted forKey:@"timeFormatted"];
    [[NSUserDefaults standardUserDefaults] setObject:timeCheck forKey:@"timeCheck"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    userInputTime.text=timeFormatted;
    
    NSDateFormatter *defaultDateFormatter = [[NSDateFormatter alloc] init];
    [defaultDateFormatter setDateFormat:@"dd/MM/yyyy"];
    
    NSString *defaultDateString = [defaultDateFormatter stringFromDate:currentDate];
    
    NSString *dateFormatted = [[NSUserDefaults standardUserDefaults] objectForKey:@"dateFormatted"];
    NSString *dateCheck = [[NSUserDefaults standardUserDefaults] objectForKey:@"dateCheck"];  
    
    if (dateCheck == nil) {
        dateFormatted = defaultDateString;
    }     
    
    else {
        
    }     
    
    [[NSUserDefaults standardUserDefaults] setObject:dateFormatted forKey:@"dateFormatted"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
}
    
- (IBAction)doCountdown:(id)sender {
    
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"inputDateTimeString"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
	// formatting date and retrieving current date
    
    NSDate *currentDate = [[NSUserDefaults standardUserDefaults] objectForKey:@"currentDate"];
	NSDateFormatter *dateformat = [[NSDateFormatter alloc] init];
	[dateformat setDateFormat:@"dd/MM/yyyy"];
    
    NSDateFormatter *dateformatToCompare = [[NSDateFormatter alloc] init];
    [dateformatToCompare setDateFormat:@"dd/MM/yyyy hh:mm a"];
    
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
	int unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
    
    NSString *currentDateString = [dateformat stringFromDate:currentDate];
    
    NSString *dateFormatted = [[NSUserDefaults standardUserDefaults] objectForKey:@"dateFormatted"];
    NSString *timeFormatted = [[NSUserDefaults standardUserDefaults] objectForKey:@"timeFormatted"];
    
    NSString *inputDateTimeString = [NSString stringWithFormat:@"%@ %@", dateFormatted, timeFormatted];    
    
    NSDate *inputDateTime = [dateformatToCompare dateFromString:inputDateTimeString];
    
    // printing strings for test (just date)
    
    userInputTime.text=timeFormatted;
    
    // storing strings
    
    [[NSUserDefaults standardUserDefaults] setObject:currentDateString forKey:@"currentDateString"];
    [[NSUserDefaults standardUserDefaults] setObject:inputDateTimeString forKey:@"inputDateTimeString"];
    
    // calculating timetoGo    
    
	NSDateComponents *timetoGo = [gregorian components:unitFlags fromDate:currentDate toDate:inputDateTime options:0];
    
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
    
    // creating name labels
    
    NSString *labelYears = @"00";
    NSString *labelMonths = @"00";
    NSString *labelDays = @"00";
    NSString *labelHours = @"00";
    NSString *labelMinutes = @"00";
    NSString *labelSeconds = @"00";
    
    // switching the message
    
    switch (timetoGoYears) {
            
        case 1:  
            messageYears = [NSString stringWithFormat:@"%02d", timetoGo.year];
            labelYears = @"year";
            //            img_years.hidden=YES;
            break;
            
        case 0:  
            messageYears = @"00";
            labelYears = @"years";
            //            img_years.hidden=NO;
            break;
            
        default:
            messageYears = [NSString stringWithFormat:@"%02d", timetoGo.year];
            labelYears = @"years";
            //            img_years.hidden=YES;
            break;
    }
    
    switch (timetoGoMonths) {
            
        case 1:  
            messageMonths = [NSString stringWithFormat:@"%02d", timetoGo.month];
            labelMonths = @"month";
            break;
            
        case 0:  
            messageMonths = @"00";
            labelMonths = @"months";
            break;
            
        default:
            messageMonths = [NSString stringWithFormat:@"%02d", timetoGo.month];
            labelMonths = @"months";
            break;
    }
    
    switch (timetoGoDays) {
            
        case 1:  
            messageDays = [NSString stringWithFormat:@"%02d", timetoGo.day];
            labelDays = @"day";
            break;
            
        case 0:  
            messageDays = @"00";
            labelDays = @"days";
            break;
            
        default:
            messageDays = [NSString stringWithFormat:@"%02d", timetoGo.day];
            labelDays = @"days";
            break;
    }
    
    switch (timetoGoHours) {
            
        case 1:  
            messageHours = [NSString stringWithFormat:@"%02d", timetoGo.hour];
            labelHours = @"hour";
            break;
            
        case 0:  
            messageHours = @"00";
            labelHours = @"hours";
            break;
            
        default:
            messageHours = [NSString stringWithFormat:@"%02d", timetoGo.hour];
            labelHours = @"hours";
            break;
    }
    
    switch (timetoGoMinutes) {
            
        case 1:  
            messageMinutes = [NSString stringWithFormat:@"%02d", timetoGo.minute];
            labelMinutes= @"minute";
            break;
            
        case 0:  
            messageMinutes = @"00";
            labelMinutes= @"minutes";
            break;
            
        default:
            messageMinutes = [NSString stringWithFormat:@"%02d", timetoGo.minute];
            labelMinutes= @"minutes";
            break;
            
    }
    
    switch (timetoGoSeconds) {
            
        case 1:  
            messageSeconds = [NSString stringWithFormat:@"%02d", timetoGo.second];
            labelSeconds= @"second";
            break;
            
        case 0:  
            messageSeconds = @"00";
            labelSeconds= @"seconds";
            break;
            
        default:
            messageSeconds = [NSString stringWithFormat:@"%02d", timetoGo.second];
            labelSeconds= @"seconds";
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
    
    [[NSUserDefaults standardUserDefaults] setObject:labelYears forKey:@"labelYears"];
    [[NSUserDefaults standardUserDefaults] setObject:labelMonths forKey:@"labelMonths"];
    [[NSUserDefaults standardUserDefaults] setObject:labelDays forKey:@"labelDays"];
    [[NSUserDefaults standardUserDefaults] setObject:labelHours forKey:@"labelHours"];
    [[NSUserDefaults standardUserDefaults] setObject:labelMinutes forKey:@"labelMinutes"];
    [[NSUserDefaults standardUserDefaults] setObject:labelSeconds forKey:@"labelSeconds"];
    
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    // check if date is valid
    
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"invalidDate"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    if (timetoGoDays <0 || timetoGoHours <0 || timetoGoMinutes <0){
        UIAlertView*alert = [[UIAlertView alloc]
                             initWithTitle:@"Invalid date"
                             message:[NSString stringWithFormat:@"The date can't be in the past"]
                             delegate:nil
                             cancelButtonTitle:@"Close"
                             otherButtonTitles:nil];
        NSString *invalidDate = @"1";
        
        [[NSUserDefaults standardUserDefaults] setObject:invalidDate forKey:@"invalidDate"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        
        [alert show];
        [alert release];
    }     
    
    [dateformat release];
    [dateformatToCompare release];
    [gregorian release];
    
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)dealloc
{
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    timePicker.date = [NSDate date];
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end

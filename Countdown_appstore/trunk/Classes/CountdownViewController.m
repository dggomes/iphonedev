//
//  CountdownViewController.m
//  Countdown
//
//  Created by Daniel Gomes on 30/04/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CountdownViewController.h"

@implementation CountdownViewController

@synthesize startCountdown;
@synthesize bg;
@synthesize userInputCountdownDate;
@synthesize userInputCountdownTime;
@synthesize currentDateLabel;
@synthesize countdownDateLabel;
@synthesize currentMessageLabel;

#pragma markstartofcode

-(IBAction)doAlert:(id)sender{
    
// getting current date and formatting
    
	NSDate *currentDate = [NSDate date];
	NSDateFormatter *dateformat = [[NSDateFormatter alloc] init];
	[dateformat setDateFormat:@"dd/MM/yyyy hh:mm:ss a"];
    
    NSDateFormatter *dateformatToCompare = [[NSDateFormatter alloc] init];
	 [dateformatToCompare setDateFormat:@"dd/MM/yyyy hh:mm a"];
    
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
	int unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
    
    NSString *currentDateString = [dateformat stringFromDate:currentDate];
    
// converting userInput to string 
    
    NSString *countdownDateString = userInputCountdownDate.text;
    NSString *countdownTimeString = userInputCountdownTime.text;
    NSString *countdownDateTimeString = [NSString stringWithFormat:@"%@ %@", countdownDateString, countdownTimeString]; 

// writing labels
    
    countdownDateLabel.text=countdownDateTimeString;
    currentDateLabel.text=currentDateString;
        
// converting string to date
    
    NSDate *countdownDate = [dateformat dateFromString:countdownDateTimeString];
    
// calculating timetoGo    

	NSDateComponents *timetoGo = [gregorian components:unitFlags fromDate:currentDate toDate:countdownDate options:0];
    
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

// TODO:
//    AM/PM selector
//    AM/PM validation
//    userInputs validation
    
// switching the message

    switch (timetoGoYears) {
            
        case 1:  
            messageYears = [NSString stringWithFormat:@"%02d year, ", timetoGo.year];
            break;

        case 0:  
            messageYears = @"";
            break;
            
        default:
            messageYears = [NSString stringWithFormat:@"%02d years, ", timetoGo.year];
            break;
    }
    
    switch (timetoGoMonths) {
            
        case 1:  
            messageMonths = [NSString stringWithFormat:@"%02d month, ", timetoGo.month];
            break;
            
        case 0:  
            messageMonths = @"";
            break;
            
        default:
            messageMonths = [NSString stringWithFormat:@"%02d months, ", timetoGo.month];
            break;
    }
    
    switch (timetoGoDays) {
            
        case 1:  
            messageDays = [NSString stringWithFormat:@"%02d day, ", timetoGo.day];
            break;
            
        case 0:  
            messageDays = @"";
            break;
            
        default:
            messageDays = [NSString stringWithFormat:@"%02d days, ", timetoGo.day];
            break;
    }
    
    switch (timetoGoHours) {
            
        case 1:  
            messageHours = [NSString stringWithFormat:@"%02d hour, ", timetoGo.hour];
            break;
            
        case 0:  
            messageHours = @"";
            break;
            
        default:
            messageHours = [NSString stringWithFormat:@"%02d hours, ", timetoGo.hour];
            break;
    }
    
    switch (timetoGoMinutes) {
            
        case 1:  
            messageMinutes = [NSString stringWithFormat:@"%02d minute and ", timetoGo.minute];
            break;
            
        case 0:  
            messageMinutes = @"";
            break;
            
        default:
            messageMinutes = [NSString stringWithFormat:@"%02d minutes and ", timetoGo.minute];
            break;

    }
    
    switch (timetoGoSeconds) {
            
        case 1:  
            messageSeconds = [NSString stringWithFormat:@"%02d second", timetoGo.second];
            break;
            
        case 0:  
            messageSeconds = @"";
            break;
            
        default:
            messageSeconds = [NSString stringWithFormat:@"%02d seconds", timetoGo.second];
            break;
    }
    
// combining message
    
        NSString *message = [NSString stringWithFormat:@"%@ %@ %@ %@ %@ %@", messageYears, messageMonths, messageDays, messageHours, messageMinutes, messageSeconds]; 
    
// printing message - for test purposes
    
    currentMessageLabel.text=message;
    
// showing alert    

    if (([userInputCountdownDate.text length] < 10) && ([userInputCountdownTime.text length] < 11)){
        
        UIAlertView*alert = [[UIAlertView alloc]
                             initWithTitle:@"Please insert a valid date and time"
                             message: nil
                             delegate:nil
                             cancelButtonTitle:@"Close"
                             otherButtonTitles:nil];    
        
        [alert show];
        [alert release];
        
    }
    
    else if ([userInputCountdownDate.text length] < 10){
   
    UIAlertView*alert = [[UIAlertView alloc]
                         initWithTitle:@"Please insert a valid date"
                         message: nil
                         delegate:nil
                         cancelButtonTitle:@"Close"
                         otherButtonTitles:nil];    

        [alert show];
        [alert release];
    
    }
    
    else if ([userInputCountdownTime.text length] < 11){
        
        UIAlertView*alert = [[UIAlertView alloc]
                             initWithTitle:@"Please insert a valid time"
                             message: nil
                             delegate:nil
                             cancelButtonTitle:@"Close"
                             otherButtonTitles:nil];    
        
        [alert show];
        [alert release];
        
    }
    
    else {
        
    UIAlertView*alert = [[UIAlertView alloc]
                         initWithTitle:@"Countdown"
                         message: message
                         delegate:nil
                         cancelButtonTitle:@"Close"
                         otherButtonTitles:nil];

        [alert show];
        [alert release];
        
    }
    

    // RELEASE STRINGS
    
    [dateformat release];
    [dateformatToCompare release];
    [gregorian release];
    
}

#pragma mark endofcode

// HIDE KEYBOARDS AFTER RETURN
// FUNCTION MUST BE ACTIVATED IN THE INTERFACE FOR THE TEXT FIELDS AS WELL

- (IBAction) hideKeyboard:(id)sender {
	[userInputCountdownDate resignFirstResponder];
    [userInputCountdownTime resignFirstResponder];
}

/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	[super viewDidLoad];
}

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateTointerfaceOrientation:(UIinterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIinterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}

- (void)dealloc {
    [UIAlertView dealloc];
    [NSCalendar dealloc];
    [NSDateFormatter dealloc];
    [NSString dealloc];
    [super dealloc];
}

@end

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

//    NSString *message = [NSString stringWithFormat:@"%02d years, %02d months, %02d days, %02d hours and %02d minutes remaining", timetoGo.year, timetoGo.month, timetoGo.day, timetoGo.hour, timetoGo.minute];
     NSString *messageYears = [NSString stringWithFormat:@"%02d years, ", timetoGo.year]; 
     NSString *messageMonths = [NSString stringWithFormat:@"%02d months, ", timetoGo.month];
     NSString *messageDays = [NSString stringWithFormat:@"%02d days, ", timetoGo.day];
     NSString *messageHours = [NSString stringWithFormat:@"%02d hours, ", timetoGo.hour];
     NSString *messageMinutes = [NSString stringWithFormat:@"%02d minutes and ", timetoGo.minute];
     NSString *messageSeconds = [NSString stringWithFormat:@"%02d seconds, ", timetoGo.second];
    
// switching the message

    switch (timetoGoYears) {
            
        case 1:  
            messageYears = [NSString stringWithFormat:@"%02d year, ", timetoGo.year];
            break;

        case 0:  
            messageYears = NULL;
            break;
            
        default:
            messageYears = @"default years";
            break;
    }
    
    switch (timetoGoMonths) {
            
        case 1:  
            messageMonths = [NSString stringWithFormat:@"%02d month, ", timetoGo.month];
            break;
            
        case 0:  
            messageMonths = NULL;
            break;
            
        default:
            messageMonths = @"default months";
            break;
    }
    
    switch (timetoGoDays) {
            
        case 1:  
            messageDays = [NSString stringWithFormat:@"%02d day, ", timetoGo.day];
            break;
            
        case 0:  
            messageDays = NULL;
            break;
            
        default:
            messageDays = @"default days";
            break;
    }
    
    switch (timetoGoHours) {
            
        case 1:  
            messageHours = [NSString stringWithFormat:@"%02d hour, ", timetoGo.hour];
            break;
            
        case 0:  
            messageHours = NULL;
            break;
            
        default:
            messageHours = @"default hours";
            break;
    }
    
    switch (timetoGoMinutes) {
            
        case 1:  
            messageMinutes = [NSString stringWithFormat:@"%02d minute, ", timetoGo.minute];
            break;
            
        case 0:  
            messageMinutes = NULL;
            break;
            
        default:
            messageMinutes = @"default minutes";
            break;
    }
    
    switch (timetoGoSeconds) {
            
        case 1:  
            messageSeconds = [NSString stringWithFormat:@"%02d second, ", timetoGo.second];
            break;
            
        case 0:  
            messageSeconds = NULL;
            break;
            
        default:
            messageSeconds = @"default seconds";
            break;
    }
    
// combining message - TEST
    
        NSString *message = [NSString stringWithFormat:@"%@ %@ %@ %@ %@ %@", messageYears, messageMonths, messageDays, messageHours, messageMinutes, messageSeconds]; 
    
// printing message - for test purposes
    
    currentMessageLabel.text=message;
    
// showing alert    

    UIAlertView*alert = [[UIAlertView alloc]
                         initWithTitle:@"Countdown"
                         message:@"x"
                         delegate:nil
                         cancelButtonTitle:@"Close"
                         otherButtonTitles:nil];
    
        [alert show];
        [alert release];
    

    // RELEASE STRINGS
    
    [dateformat release];
    [dateformatToCompare release];
    [gregorian release];
    
}

#pragma mark endofcode

// HIDE KEYBOARDS AFTER RETURN
// FUNCTION MUST BE ACTIVATED IN THE INTERFACE FOR THE TEXT FIELDS ALSO

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

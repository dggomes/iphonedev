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

#pragma markstartofcode

//criar funcao que gera labels ao terminar de digitar
//isolar funcao de alerta

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
    
    //include selector to AM/PM

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

    // howt to show just the fields with value? do we need to calculate timetogo in seconds to discover which fields to present?

    
// showing alert    

    // IF RULES        
    
    // rule1: years <= 0
    // rule2: years <= 0 && months <= 0
    // rule3: years <= 0 && months <= 0 && days <= 0
    // rule4: years <= 0 && months <= 0 && days <= 0 && hours <= 0
    // rule5: years <= 0 && months <= 0 && days <= 0 && hours <= 0 && minutes <= 0
    
    // create rule for plural; create rule for lack of AM/PM

    // rule1: years <= 0 && months <= 0 && days <= 0  && hours <=0 && minutes <=0   
    
    if ((timetoGoYears <= 0) && (timetoGoMonths <= 0) && (timetoGoDays <=0) && (timetoGoHours <=0) && (timetoGoMinutes <=0)){
        UIAlertView*alert = [[UIAlertView alloc]
                             initWithTitle:@"Countdown"
                             message:[NSString stringWithFormat:@"Date invalid"]
                             delegate:nil
                             cancelButtonTitle:@"Close"
                             otherButtonTitles:nil];
        [alert show];
        [alert release];
    }  
    
    // rule2: years <= 0 && months <= 0 && days <= 0  && hours <=0
    
    else if ((timetoGoYears <= 0) && (timetoGoMonths <= 0) && (timetoGoDays <=0) && (timetoGoHours <=0)){
        UIAlertView*alert = [[UIAlertView alloc]
                             initWithTitle:@"Countdown"
                             message:[NSString stringWithFormat:@"%02d minutes remaining", timetoGo.minute]
                             delegate:nil
                             cancelButtonTitle:@"Close"
                             otherButtonTitles:nil];
        [alert show];
        [alert release];
    }    

    // rule3: years <= 0 && months <= 0 && days <= 0   
    
    else if ((timetoGoYears <= 0) && (timetoGoMonths <= 0) && (timetoGoDays <=0)){
        UIAlertView*alert = [[UIAlertView alloc]
                             initWithTitle:@"Countdown"
                             message:[NSString stringWithFormat:@"%02d hours, %02d minutes remaining", timetoGo.hour, timetoGo.minute]
                             delegate:nil
                             cancelButtonTitle:@"Close"
                             otherButtonTitles:nil];
        [alert show];
        [alert release];
    }
    
    // rule4: years <= 0 && months <= 0
    
    else if ((timetoGoYears <= 0) && (timetoGoMonths <= 0)){
		UIAlertView*alert = [[UIAlertView alloc]
							 initWithTitle:@"Countdown"
                             message:[NSString stringWithFormat:@"%02d days, %02d hours, %02d minutes remaining", timetoGo.day, timetoGo.hour, timetoGo.minute]
							 delegate:nil
							 cancelButtonTitle:@"Close"
							 otherButtonTitles:nil];
		[alert show];
		[alert release];
    }
    
    //rule5: years <= 0
    
    else if (timetoGoYears <= 0){
		UIAlertView*alert = [[UIAlertView alloc]
							 initWithTitle:@"Countdown"
                             message:[NSString stringWithFormat:@"%02d months, %02d days, %02d hours, %02d minutes remaining", timetoGo.month, timetoGo.day, timetoGo.hour, timetoGo.minute]
							 delegate:nil
							 cancelButtonTitle:@"Close"
							 otherButtonTitles:nil];
		[alert show];
		[alert release];
	}     
    
    // rule6: standard
    
    else {
		UIAlertView*alert = [[UIAlertView alloc]
							 initWithTitle:@"Countdown"
                             message:[NSString stringWithFormat:@"%02d years, %02d months, %02d days, %02d hours, %02d minutes remaining", timetoGo.year, timetoGo.month, timetoGo.day, timetoGo.hour, timetoGo.minute]
							 delegate:nil
							 cancelButtonTitle:@"Close"
							 otherButtonTitles:nil];
		[alert show];
		[alert release];
	}          
        
// RELEASE STRINGS
    
//    [countdownDate release];
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

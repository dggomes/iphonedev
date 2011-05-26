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

// showing alert    

    // IF RULES        
    
    // rule1: years <= 0 && months <= 0 && days <= 0 && hours <= 0 && minutes <= 0 -> invalid
    
    // rule2a: years <= 0 && months <= 0 && days <= 0 && hours <= 0 && minutes = 1 -> just minute
    // rule2b: years <= 0 && months <= 0 && days <= 0 && hours <= 0 -> just minutes
    
    // rule3a: years <= 0 && months <= 0 && days <= 0 && hours = 1 && minutes = 1 -> hour and minute
    // rule3b: years <= 0 && months <= 0 && days <= 0 && hours = 1 -> hour and minutes
    // rule3c: years <= 0 && months <= 0 && days <= 0 && minutes = 1 -> hours and minute
    // rule3d: years <= 0 && months <= 0 && days <= 0 -> hours and minutes

    // rule4a: years <= 0 && months <= 0 && minutes = 1 -> days, hours and minute
    // rule4b: years <= 0 && months <= 0 -> days, hours and minutes
    // rule4c: years <= 0 && months <= 0 && hours = 1 && minutes = 1 -> days, hour and minute
    // rule4d: years <= 0 && months <= 0 && hours = 1 -> days, hour and minutes
    // rule4e: years <= 0 && months <= 0 && days = 1 && minutes = 1 -> day, hours and minute
    // rule4f: years <= 0 && months <= 0 && days = 1 -> day, hours and minutes
    // rule4g: years <= 0 && months <= 0 && days = 1 && days = 1 && minutes = 1 -> day, hour and minute
    // rule4h: years <= 0 && months <= 0 && days = 1 && days = 1 -> day, hour and minutes
    
    // rule5a: years <= 0 && minutes = 1 -> months, days, hours and minute
    // rule5b: years <= 0 -> months, days, hours and minutes
    // rule5c: years <= 0 && hours = 1 && minutes = 1 -> months, days, hour and minute
    // rule5d: years <= 0 && hours = 1 -> months, days, hour and minutes
    // rule5e: years <= 0 && days = 1 && minutes = 1 -> months, day, hours and minute
    // rule5f: years <= 0 && days = 1 -> months, day, hours and minutes
    // rule5g: years <= 0 && days = 1 && days = 1 && minutes = 1 -> months, day, hour and minute
    // rule5h: years <= 0 && days = 1 && days = 1 -> month, day, hour and minutes
    // rule5i: years <= 0 && months = 1 && minutes = 1 -> month, days, hours and minute
    // rule5j: years <= 0 && months = 1 -> month, days, hours and minutes
    // rule5k: years <= 0 && months = 1 && hours = 1 && minutes = 1 -> month, days, hour and minute
    // rule5l: years <= 0 && months = 1 && hours = 1 -> month, days, hour and minutes
    // rule5m: years <= 0 && months = 1 && days = 1 && minutes = 1 -> month, day, hours and minute
    // rule5n: years <= 0 && months = 1 && days = 1 -> month, day, hours and minutes
    // rule5o: years <= 0 && months = 1 && days = 1 && days = 1 && minutes = 1 -> month, day, hour and minute
    // rule5p: years <= 0 && months = 1 && days = 1 && days = 1 -> month, day, hour and minutes

    // rule6a: years > 0 && minutes = 1 -> years, months, days, hours and minute
    // rule6b: years > 0 && -> years, months, days, hours and minutes
    // rule6c: years > 0 && hours = 1 && minutes = 1 -> years, months, days, hour and minute
    // rule6d: years > 0 && hours = 1 -> years, months, days, hour and minutes
    // rule6e: years > 0 && days = 1 && minutes = 1 -> years, months, day, hours and minute
    // rule6f: years > 0 && days = 1 -> years, months, day, hours and minutes
    // rule6g: years > 0 && days = 1 && days = 1 && minutes = 1 -> years, months, day, hour and minute
    // rule6h: years > 0 && days = 1 && days = 1 -> years, month, day, hour and minutes
    // rule6i: years > 0 && months = 1 && minutes = 1 -> years, month, days, hours and minute
    // rule6j: years > 0 && months = 1 -> years, month, days, hours and minutes
    // rule6k: years > 0 && months = 1 && hours = 1 && minutes = 1 -> years, month, days, hour and minute
    // rule6l: years > 0 && months = 1 && hours = 1 -> years, month, days, hour and minutes
    // rule6m: years > 0 && months = 1 && days = 1 && minutes = 1 -> years, month, day, hours and minute
    // rule6n: years > 0 && months = 1 && days = 1 -> years, month, day, hours and minutes
    // rule6o: years > 0 && months = 1 && days = 1 && days = 1 && minutes = 1 -> years, month, day, hour and minute
    // rule6p: years > 0 && months = 1 && days = 1 && days = 1 -> years, month, day, hour and minutes    
    // rule6aa: years = 1 && minutes = 1 -> year, months, days, hours and minute
    // rule6bb: years = 1 && -> year, months, days, hours and minutes
    // rule6cc: years = 1 && hours = 1 && minutes = 1 -> year, months, days, hour and minute
    // rule6dd: years = 1 && hours = 1 -> year, months, days, hour and minutes
    // rule6ee: years = 1 && days = 1 && minutes = 1 -> year, months, day, hours and minute
    // rule6ff: years = 1 && days = 1 -> year, months, day, hours and minutes
    // rule6gg: years = 1 && days = 1 && days = 1 && minutes = 1 -> year, months, day, hour and minute
    // rule6hh: years = 1 && days = 1 && days = 1 -> year, month, day, hour and minutes
    // rule6ii: years = 1 && months = 1 && minutes = 1 -> year, month, days, hours and minute
    // rule6jj: years = 1 && months = 1 -> year, month, days, hours and minutes
    // rule6kk: years = 1 && months = 1 && hours = 1 && minutes = 1 -> year, month, days, hour and minute
    // rule6ll: years = 1 && months = 1 && hours = 1 -> year, month, days, hour and minutes
    // rule6mm: years = 1 && months = 1 && days = 1 && minutes = 1 -> year, month, day, hours and minute
    // rule6nn: years = 1 && months = 1 && days = 1 -> year, month, day, hours and minutes
    // rule6oo: years = 1 && months = 1 && days = 1 && days = 1 && minutes = 1 -> year, month, day, hour and minute
    // rule6pp: years = 1 && months = 1 && days = 1 && days = 1 -> year, month, day, hour and minutes

    // rule6: standard -> years, months, days, hours and minutes

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

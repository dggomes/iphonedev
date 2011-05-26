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
	[dateformat setDateFormat:@"dd/MM/yyyy hh:mm:ss"];

    
    NSDateFormatter *dateformatToCompare = [[NSDateFormatter alloc] init];
	 [dateformatToCompare setDateFormat:@"dd/MM/yyyy hh:mm"];
    
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
	int unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
    
// inserting userinput to labels
    
    NSString *countdownDateString = userInputCountdownDate.text;
    NSString *countdownTimeString = userInputCountdownTime.text;
    NSString *countdownDateTimeString = [NSString stringWithFormat:@"%@ %@", countdownDateString, countdownTimeString]; 
    countdownDateLabel.text=countdownDateTimeString;
    
    
// converting string to date
    
    NSDate *countdownDate = [dateformat dateFromString:countdownDateTimeString];
    
// calculating timeto    

	NSDateComponents *timetoGo = [gregorian components:unitFlags fromDate:currentDate toDate:countdownDate options:0];
    
    // showing alert

    UIAlertView*alert = [[UIAlertView alloc]
                         initWithTitle:@"Countdown!"
                         message:nil
//                         message:[NSString stringWithFormat:@"%02d years, %02d months, %02d days, %02d hours, %02 minutes, %02 seconds", timetoGo.year, timetoGo.month, timetoGo.day, timetoGo.hour, timetoGo.second]
                         delegate:nil
                         cancelButtonTitle:@"Fechar"
                         otherButtonTitles:nil];
    [alert show];
    [alert release];


// howt to show just the fields with value? do we need to calculate timetogo in seconds to discover which fields to present?
    
//    transformar year, hours, etc em INT
//    If o int maior que 1... mostrar field, otherwise nao mostrarx ??
    
/*
    
// calculating timetoGo in seconds    
    
    //timetoGo
    
    int timetoGoDays = [timetoGo day];
    int timetoGoHours = [timetoGo hour];
    int timetoGoMinutes = [timetoGo minute];
    int timetoGoSeconds = [timetoGo second];   
    
    //convert timetoGoDays to seconds
 
    #define SECOND 1
    #define MINUTE (60 * SECOND)
    #define HOUR (60 * MINUTE)
    #define DAY (24 * HOUR)
    #define MONTH (30 * DAY)
    
    int daystoGoinSeconds = (timetoGoDays * DAY);

    int hourstoGoinSeconds = (timetoGoHours * HOUR);

    int minutestoGoinSeconds = (timetoGoMinutes * MINUTE);

    //get total seconds
    
    int timetoGoDaysinSeconds = (daystoGoinSeconds + hourstoGoinSeconds + minutestoGoinSeconds + timetoGoSeconds);

// IF RULES        
    
    // rule1: Birthday
    // rule2: AnniversaryDayMay
    // rule3: AnnyversaryDayJun
    // rule4: ValentineDay
    // rule5: >=40 days so >= 3456000 seconds
    // rule6: >30 and <40 days so > 2592000 and < 3456000 seconds
    // rule7: >15 and <=30 days so > 1296000 and < 2592000 seconds
    // rule8: >7 and <=15 days so > 6048000 and < 1296000 seconds
    // rule9: >1 and <7 days so > 86400 and < 1296000 seconds
    // rule10: >0 and <=1 days so = 86400 seconds
    // rule11: <0 days so = <0 seconds
    
    //rule1:
    
    if ([currentDateString isEqualToString:@"12/05/2011"]){
		UIAlertView*alert = [[UIAlertView alloc]
							 initWithTitle:@"Rule1!"
							 message:nil
							 delegate:nil
							 cancelButtonTitle:@"Fechar"
							 otherButtonTitles:nil];
		[alert show];
		[alert release];
	}     

    // rule2: AnniversaryDayMay
    
    else if ([currentDateString isEqualToString:@"11/05/2011"]){
		UIAlertView*alert = [[UIAlertView alloc]
							 initWithTitle:@"Rule2!"
							 message:nil
							 delegate:nil
							 cancelButtonTitle:@"Fechar"
							 otherButtonTitles:nil];
		[alert show];
		[alert release];
	}     

    // rule3: AnnyversaryDayJun    
    
    else if ([currentDateString isEqualToString:@"11/06/2011"]){
		UIAlertView*alert = [[UIAlertView alloc]
							 initWithTitle:@"Rule3!"
							 message:nil
							 delegate:nil
							 cancelButtonTitle:@"Fechar"
							 otherButtonTitles:nil];
		[alert show];
		[alert release];
	}     

    // rule4: ValentineDay
    
    else if ([currentDateString isEqualToString:@"12/06/2011"]){
		UIAlertView*alert = [[UIAlertView alloc]
							 initWithTitle:@"Rule4!"
							 message:nil
							 delegate:nil
							 cancelButtonTitle:@"Fechar"
							 otherButtonTitles:nil];
		[alert show];
		[alert release];
	}         

    // rule5: >=40 days so >= 3456000 seconds    
    
    else if (timetoGoDaysinSeconds >= 3456000){
		UIAlertView*alert = [[UIAlertView alloc]
							 initWithTitle:@"Rule5!"
							 message:nil
							 delegate:nil
							 cancelButtonTitle:@"Fechar"
							 otherButtonTitles:nil];
		[alert show];
		[alert release];
	}     

    // rule6: >30 and <40 days so > 2592000 and < 3456000 seconds
    
    else if ((timetoGoDaysinSeconds > 2592000)&&(timetoGoDaysinSeconds < 3456000)){
		UIAlertView*alert = [[UIAlertView alloc]
							 initWithTitle:@"Rule6!"
							 message:nil
							 delegate:nil
							 cancelButtonTitle:@"Fechar"
							 otherButtonTitles:nil];
		[alert show];
		[alert release];
	}         
    
    // rule7: >15 and <=30 days so > 1296000 and < 2592000 seconds

    else if ((timetoGoDaysinSeconds > 1296000)&&(timetoGoDaysinSeconds < 2592000)){
		UIAlertView*alert = [[UIAlertView alloc]
							 initWithTitle:@"Rule7!"
							 message:nil
							 delegate:nil
							 cancelButtonTitle:@"Fechar"
							 otherButtonTitles:nil];
		[alert show];
		[alert release];
	}         
    
    // rule8: >7 and <=15 days so > 6048000 and < 1296000 seconds - BUGGED
    
    else if ((timetoGoDaysinSeconds > 604800)&&(timetoGoDaysinSeconds < 1296000)){
		UIAlertView*alert = [[UIAlertView alloc]
							 initWithTitle:@"Rule8!"
							 message:nil
							 delegate:nil
							 cancelButtonTitle:@"Fechar"
							 otherButtonTitles:nil];
		[alert show];
		[alert release];
	}         

    // rule9: >1 and <7 days so > 86400 and < 604800 seconds
    
    else if ((timetoGoDaysinSeconds > 86400)&&(timetoGoDaysinSeconds < 604800)){
		UIAlertView*alert = [[UIAlertView alloc]
							 initWithTitle:@"Rule9!"
							 message:nil
							 delegate:nil
							 cancelButtonTitle:@"Fechar"
							 otherButtonTitles:nil];
		[alert show];
		[alert release];
	}         
    
    
    // rule10: >0 and <=1 days so = >0 and <= 86400 seconds
    
    else if ((timetoGoDaysinSeconds > 0)&&(timetoGoDaysinSeconds <= 86400)){
		UIAlertView*alert = [[UIAlertView alloc]
							 initWithTitle:@"Rule10!"
							 message:nil
							 delegate:nil
							 cancelButtonTitle:@"Fechar"
							 otherButtonTitles:nil];
		[alert show];
		[alert release];
	}         
    
    // rule11: <0 days so = <0 seconds
    
    else if (timetoGoDaysinSeconds < 0){
		UIAlertView*alert = [[UIAlertView alloc]
							 initWithTitle:@"Rule11!"
							 message:nil
							 delegate:nil
							 cancelButtonTitle:@"Fechar"
							 otherButtonTitles:nil];
		[alert show];
		[alert release];
	}         
    
    // general rule
    
    else  { 
		UIAlertView*alert =[[UIAlertView alloc]
							initWithTitle:@"General rule!"
							message:nil
							delegate:nil 
							cancelButtonTitle:@"Fechar"
							otherButtonTitles:nil];
		[alert show];
		[alert release]; 
        
    }
     
     */
    
// RELEASE STRINGS
    
    [countdownDate release];
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

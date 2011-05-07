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
@synthesize today;
//@synthesize todayLabel;
//@synthesize todayLabel2;
//@synthesize string1;
//@synthesize string2;

#pragma mark function

/*
 
-(IBAction)doAlert:(id)sender{

	NSDate *currentDate = [NSDate date];
	NSDateFormatter *dateformat = [[NSDateFormatter alloc] init];
	[dateformat setDateFormat:@"dd/MM/yyyy hh:mm:ss"];
	NSString *arrivalDay = [[NSString alloc] initWithString:@"17/06/2011 00:00:01"];
	NSDate *arrivalDate = [dateformat dateFromString:arrivalDay];

	NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
	int unitFlags = NSDayCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
	NSDateComponents *components = [gregorian components:unitFlags fromDate:currentDate toDate:arrivalDate options:0];
	
//	NSString *string1 = [dateformat stringFromDate:currentDate];
//	NSString *string2 = [NSString stringWithFormat:@"%02d", components.day];
//	int dif = [string2 intValue];
	int dif = [[NSString stringWithFormat:@"%02d", components.day] intValue];
	
//	[todayLabel setText:string1];
//	[todayLabel2 setText:dif];
	
	if (dif >= 30){
	
	UIAlertView*alert = [[UIAlertView alloc]
						 initWithTitle:@"Calma que vai voar!"
						 message:[NSString stringWithFormat:@"%02d dias", components.day]
						 delegate:nil
						 cancelButtonTitle:@"Fechar"
						 otherButtonTitles:nil];
	[alert show];
	[alert release];
}       
	
	else if ((dif >=15)&&(dif <=30)){
		
		UIAlertView*alert = [[UIAlertView alloc]
							 initWithTitle:@"Menos de um mes, amor!"
							 message:[NSString stringWithFormat:@"%02d dias", components.day]
							 delegate:nil
							 cancelButtonTitle:@"Fechar"
							 otherButtonTitles:nil];
		[alert show];
		[alert release];
	}       

	else if ((dif >=10)&&(dif <=15)){
		
		UIAlertView*alert = [[UIAlertView alloc]
							 initWithTitle:@"So mais um pouquinho!"
							 message:[NSString stringWithFormat:@"%02d dias", components.day]
							 delegate:nil
							 cancelButtonTitle:@"Fechar"
							 otherButtonTitles:nil];
		[alert show];
		[alert release];
	}
	
	else if (dif <=0){
		
		UIAlertView*alert = [[UIAlertView alloc]
							 initWithTitle:@"Cheguei!"
							 message:nil
							 delegate:nil
							 cancelButtonTitle:@"Fechar"
							 otherButtonTitles:nil];
		[alert show];
		[alert release];
	}
	
	else  { 
	UIAlertView*alert =[[UIAlertView alloc]
						initWithTitle:@"To chegando!"
						message:[NSString stringWithFormat:@"%02d dias", components.day]
						delegate:nil 
						cancelButtonTitle:@"Fechar"
						otherButtonTitles:nil];
	[alert show];
	[alert release];        
	    
}

}

*/

#pragma mark birthday

-(IBAction)doAlert:(id)sender{
	
	NSDate *currentDate = [NSDate date];
	NSDateFormatter *dateformat = [[NSDateFormatter alloc] init];
	[dateformat setDateFormat:@"dd/MM/yyyy hh:mm:ss"];
	NSString *arrivalDay = [[NSString alloc] initWithString:@"17/06/2011 00:00:01"];
	NSString *birthDay = [[NSString alloc] initWithString:@"12/05/2011 00:00:01"];
    NSString *anniversaryDay = [[NSString alloc] initWithString:@"11/05/2011 00:00:01"];
    NSString *anniversaryDayJun = [[NSString alloc] initWithString:@"11/06/2011 00:00:01"];
    NSString *valentineDay = [[NSString alloc] initWithString:@"12/06/2011 00:00:01"];
    NSString *wrongDay = [[NSString alloc] initWithString:@"10/05/2011 00:00:01"]; //workaround to fix the bug - 10th as anniversaryDay
    NSString *wrongDayJun = [[NSString alloc] initWithString:@"10/06/2011 00:00:01"]; //workaround to fix the bug - 10th as anniversaryDay
    
	NSDate *arrivalDate = [dateformat dateFromString:arrivalDay];
	NSDate *birthDate = [dateformat dateFromString:birthDay];
    NSDate *anniversaryDate = [dateformat dateFromString:anniversaryDay];
    NSDate *anniversaryDateJun = [dateformat dateFromString:anniversaryDayJun];
    NSDate *valentineDate = [dateformat dateFromString:valentineDay];
    NSDate *wrongDate = [dateformat dateFromString:wrongDay];
    NSDate *wrongDateJun = [dateformat dateFromString:wrongDayJun];
	
	NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
	int unitFlags = NSDayCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
    
	NSDateComponents *timetoGo = [gregorian components:unitFlags fromDate:currentDate toDate:arrivalDate options:0];
	NSDateComponents *timetoBirthDay = [gregorian components:unitFlags fromDate:currentDate toDate:birthDate options:0];
	NSDateComponents *timetoAnniversaryDay = [gregorian components:unitFlags fromDate:currentDate toDate:anniversaryDate options:0];
    NSDateComponents *timetoValentineDay = [gregorian components:unitFlags fromDate:currentDate toDate:valentineDate options:0];
	NSDateComponents *timetoAnniversaryDayJun = [gregorian components:unitFlags fromDate:currentDate toDate:anniversaryDateJun options:0];
	NSDateComponents *timetoWrongDay = [gregorian components:unitFlags fromDate:currentDate toDate:wrongDate options:0];
    NSDateComponents *timetoWrongDayJun = [gregorian components:unitFlags fromDate:currentDate toDate:wrongDateJun options:0];
    
	//	NSString *string1 = [dateformat stringFromDate:currentDate];
	//	NSString *string2 = [NSString stringWithFormat:@"%02d", components.day];
	//	int dif = [string2 intValue];
	int dif = [[NSString stringWithFormat:@"%02d", timetoGo.day] intValue];
    int dif2 = [[NSString stringWithFormat:@"%02d", timetoBirthDay.day] intValue];
    int dif3 = [[NSString stringWithFormat:@"%02d", timetoAnniversaryDay.day] intValue];
    int dif4 = [[NSString stringWithFormat:@"%02d", timetoWrongDay.day] intValue];
    int dif5 = [[NSString stringWithFormat:@"%02d", timetoAnniversaryDayJun.day] intValue];
    int dif6 = [[NSString stringWithFormat:@"%02d", timetoValentineDay.day] intValue];
    int dif7 = [[NSString stringWithFormat:@"%02d", timetoWrongDayJun.day] intValue];
	
	//	[todayLabel setText:string1];
	//	[todayLabel2 setText:dif];

    if ((dif3 == 0)&&(dif4 != 0)){
		UIAlertView*alert = [[UIAlertView alloc]
							 initWithTitle:@"8 MESES AMOR!"
							 message:nil
							 delegate:nil
							 cancelButtonTitle:@"Te amo"
							 otherButtonTitles:nil];
		[alert show];
		[alert release];
	}     

    
	else if (dif2 == 0){
		UIAlertView*alert = [[UIAlertView alloc]
							 initWithTitle:@"Parabens!"
							 message:@"Que contagem regressiva, o que... Hoje e seu aniversario!!! Parabens, meu amor! :)"
							 delegate:nil
							 cancelButtonTitle:@"Curtir"
							 otherButtonTitles:nil];
		[alert show];
		[alert release];
	}     

    else if ((dif5 == 0)&&(dif7 != 0)){
		UIAlertView*alert = [[UIAlertView alloc]
							 initWithTitle:@"WOW!"
							 message:@"9 MESES!"
							 delegate:nil
							 cancelButtonTitle:@"Te amo"
							 otherButtonTitles:nil];
		[alert show];
		[alert release];
	}     

    else if (dif6 == 0){
		UIAlertView*alert = [[UIAlertView alloc]
							 initWithTitle:@"Sorry :("
							 message:[NSString stringWithFormat:@"Queria passar o dia dos namorados com voce, mas como estou tao longe, espera um pouquinho que daqui a %02d dias a gente compensa! Te amo muito!", timetoGo.day]
//							 message:@"Queria passar o dia dos namorados com voce, mas como estou tao longe, espera um pouquinho que daqui a %02d dias a gente compensa ;)"
							 delegate:nil
							 cancelButtonTitle:@"Combinado"
							 otherButtonTitles:nil];
		[alert show];
		[alert release];
	} 
    
	else if (dif >= 40){
		
		UIAlertView*alert = [[UIAlertView alloc]
							 initWithTitle:@"Calma que vai voar!"
							 message:[NSString stringWithFormat:@"%02d dias", timetoGo.day]
							 delegate:nil
							 cancelButtonTitle:@"Fechar"
							 otherButtonTitles:nil];
		[alert show];
		[alert release];
	}       
	
    else if ((dif >=30)&&(dif <=40)){
		
		UIAlertView*alert = [[UIAlertView alloc]
							 initWithTitle:@"Ei, nao desiste hein! Continua me esperando!"
							 message:[NSString stringWithFormat:@"%02d dias", timetoGo.day]
							 delegate:nil
							 cancelButtonTitle:@"Fechar"
							 otherButtonTitles:nil];
		[alert show];
		[alert release];
	}       
    
	else if ((dif >=15)&&(dif <=30)){
		
		UIAlertView*alert = [[UIAlertView alloc]
							 initWithTitle:@"Menos de um mes, amor!"
							 message:[NSString stringWithFormat:@"%02d dias", timetoGo.day]
							 delegate:nil
							 cancelButtonTitle:@"Fechar"
							 otherButtonTitles:nil];
		[alert show];
		[alert release];
	}       
	
	else if ((dif >1)&&(dif <=15)){
		
		UIAlertView*alert = [[UIAlertView alloc]
							 initWithTitle:@"So mais um pouquinho!"
							 message:[NSString stringWithFormat:@"%02d dias e %02d horas", timetoGo.day, timetoGo.hour]
							 delegate:nil
							 cancelButtonTitle:@"Fechar"
							 otherButtonTitles:nil];
		[alert show];
		[alert release];
	}
	
    else if (dif == 1){
		
		UIAlertView*alert = [[UIAlertView alloc]
							 initWithTitle:@"Are you ready?"
							 message:[NSString stringWithFormat:@"%02d dia e %02d horas", timetoGo.day, timetoGo.hour]
							 delegate:nil
							 cancelButtonTitle:@"Fechar"
							 otherButtonTitles:nil];
		[alert show];
		[alert release];
	}
	
	else  { 
		UIAlertView*alert =[[UIAlertView alloc]
							initWithTitle:@"To chegando!"
							message:nil
							delegate:nil 
							cancelButtonTitle:@"Fechar"
							otherButtonTitles:nil];
		[alert show];
		[alert release];        
	    
	}
//    [currentDate release];
	[arrivalDay release];
//    [arrivalDate release];
    [birthDay release];
//    [birthDate release];
    [anniversaryDay release];
    [anniversaryDayJun release];
//    [anniversaryDate release];
    [valentineDay release];
    [wrongDay release];
    [wrongDayJun release];
    
    [gregorian release];
    [dateformat release];
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
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
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
    [super dealloc];
}

@end

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
// @synthesize label1;

#pragma markstartofcode

-(IBAction)doAlert:(id)sender{

    NSDate *currentDate = [NSDate date];
    NSDateFormatter *dateformat = [[NSDateFormatter alloc] init];
    [dateformat setDateFormat:@"dd/MM/yyyy hh:mm:ss a"];
    
    
    NSDateFormatter *dateformatToCompare = [[NSDateFormatter alloc] init];
    [dateformatToCompare setDateFormat:@"dd/MM/yyyy"];
    
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    int unitFlags = NSDayCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
    
    // defining date to compare   
    
    NSString *currentDateString = [dateformatToCompare stringFromDate:[NSDate date]];
    
    NSString *arrivalDay = [[NSString alloc] initWithString:@"12/10/2011 9:15:00 PM"];
    
    // converting string to date
    
    NSDate *arrivalDate = [dateformat dateFromString:arrivalDay];
    
    // calculating timeto    
    
    NSDateComponents *timetoGo = [gregorian components:unitFlags fromDate:currentDate toDate:arrivalDate options:0];
    
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
    
    //    label1.text=[NSString stringWithFormat:@"%02d year, ", timetoGoDaysinSeconds];
    
    // IF RULES        
    
    //rule1:
    
    if ([currentDateString isEqualToString:@"11/07/2011"]){
        UIAlertView*alert = [[UIAlertView alloc]
                             initWithTitle:@"Parabéns, amor! 10 meses!"
                             message:[NSString stringWithFormat:@"E agora só faltam mais %02d dias", timetoGo.day]
                             delegate:nil
                             cancelButtonTitle:@"Fechar"
                             otherButtonTitles:nil];
        [alert show];
        [alert release];
    }     
    
    // rule2:
    
    else if ([currentDateString isEqualToString:@"11/08/2011"]){
        UIAlertView*alert = [[UIAlertView alloc]
                             initWithTitle:@"11 meses amor!"
                             message:[NSString stringWithFormat:@"Já bati o recorde? Só mais %02d dias pra eu te ver!", timetoGo.day]
                             delegate:nil
                             cancelButtonTitle:@"Fechar"
                             otherButtonTitles:nil];
        [alert show];
        [alert release];
    }     
    
    // rule3:
    
    else if ([currentDateString isEqualToString:@"11/09/2011"]){
        UIAlertView*alert = [[UIAlertView alloc]
                             initWithTitle:@"UM ANO, MEU AMOR!"
                             message:@"Thanks por me fazer tão feliz! Daqui a um mês to aí!"
                             delegate:nil
                             cancelButtonTitle:@"Fechar"
                             otherButtonTitles:nil];
        [alert show];
        [alert release];
    }         
    
    // rule4:
    
    else if ([currentDateString isEqualToString:@"11/10/2011"]){
        UIAlertView*alert = [[UIAlertView alloc]
                             initWithTitle:@"Ei! Parabens :)"
                             message:@"Mas o que importa é que amanhã to aí!!!"
                             delegate:nil
                             cancelButtonTitle:@"Fechar"
                             otherButtonTitles:nil];
        [alert show];
        [alert release];
    }         
    
    // rule5: >75 days so > 6480000 seconds    
    
    else if (timetoGoDaysinSeconds > 6480000){
        UIAlertView*alert = [[UIAlertView alloc]
                             initWithTitle:@"Ainda tem tempo :("
                             message:[NSString stringWithFormat:@"%02d dias", timetoGo.day]
                             delegate:nil
                             cancelButtonTitle:@"Fechar"
                             otherButtonTitles:nil];
        [alert show];
        [alert release];
    }     
    
    // rule6: >50 days and <=75 so > 4320000 and <= 6480000 seconds    
    
    else if ((timetoGoDaysinSeconds > 4320000)&&(timetoGoDaysinSeconds <= 6480000)){
        UIAlertView*alert = [[UIAlertView alloc]
                             initWithTitle:@"Nao é que o tempo tá passando rápido?"
                             message:[NSString stringWithFormat:@"%02d dias", timetoGo.day]
                             delegate:nil
                             cancelButtonTitle:@"Fechar"
                             otherButtonTitles:nil];
        [alert show];
        [alert release];
    }     
    
    // rule7: >30 and <=50 days so > 2592000 and <= 4320000 seconds
    
    else if ((timetoGoDaysinSeconds > 2592000)&&(timetoGoDaysinSeconds <= 4320000)){
        UIAlertView*alert = [[UIAlertView alloc]
                             initWithTitle:@"Calma que o pior já passou!!"
                             message:[NSString stringWithFormat:@"Só mais %02d dias", timetoGo.day]
                             delegate:nil
                             cancelButtonTitle:@"Fechar"
                             otherButtonTitles:nil];
        [alert show];
        [alert release];
    }         
    
    // rule7: >15 and <=30 days so > 1296000 and < 2592000 seconds
    
    else if ((timetoGoDaysinSeconds > 1296000)&&(timetoGoDaysinSeconds < 2592000)){
        UIAlertView*alert = [[UIAlertView alloc]
                             initWithTitle:@"Menos de um mês, amor!"
                             message:[NSString stringWithFormat:@"Só mais %02d dias", timetoGo.day]
                             delegate:nil
                             cancelButtonTitle:@"Fechar"
                             otherButtonTitles:nil];
        [alert show];
        [alert release];
    }         
    
    // rule8: >7 and <=15 days so > 6048000 and < 1296000 seconds - BUGGED
    
    else if ((timetoGoDaysinSeconds > 604800)&&(timetoGoDaysinSeconds < 1296000)){
        UIAlertView*alert = [[UIAlertView alloc]
                             initWithTitle:@"Só mais um pouquinho!"
                             message:[NSString stringWithFormat:@"%02d dias", timetoGo.day]
                             delegate:nil
                             cancelButtonTitle:@"Fechar"
                             otherButtonTitles:nil];
        [alert show];
        [alert release];
    }         
    
    // rule9: >=1 and <7 days so > 86400 and < 604800 seconds
    
    else if ((timetoGoDaysinSeconds >= 86400)&&(timetoGoDaysinSeconds < 604800)){
        UIAlertView*alert = [[UIAlertView alloc]
                             initWithTitle:@"Já to chegando!"
                             message:[NSString stringWithFormat:@"%02d dias e %02d horas", timetoGo.day, timetoGo.hour]
                             delegate:nil
                             cancelButtonTitle:@"Fechar"
                             otherButtonTitles:nil];
        [alert show];
        [alert release];
    }         
    
    // rule10: >14hour and <=1 days so = >50400 and <= 86400 seconds
    
    else if ((timetoGoDaysinSeconds > 50400)&&(timetoGoDaysinSeconds < 86400)){
        UIAlertView*alert = [[UIAlertView alloc]
                             initWithTitle:@"Só mais umas horinhas!"
                             message:[NSString stringWithFormat:@"%02d horas", timetoGo.hour]
                             delegate:nil
                             cancelButtonTitle:@"Fechar"
                             otherButtonTitles:nil];
        [alert show];
        [alert release];
    }         
    
    // rule11: >1hour and <=1 days so = >3600 and <= 86400 seconds
    
    else if ((timetoGoDaysinSeconds > 3600)&&(timetoGoDaysinSeconds < 86400)){
        UIAlertView*alert = [[UIAlertView alloc]
                             initWithTitle:@"Já to no avião!"
                             message:[NSString stringWithFormat:@"%02d horas", timetoGo.hour]
                             delegate:nil
                             cancelButtonTitle:@"Fechar"
                             otherButtonTitles:nil];
        [alert show];
        [alert release];
    }         
    
    // rule12: >0 and <=1 hour so = >0 and <= 3600 seconds
    
    else if ((timetoGoDaysinSeconds > 0)&&(timetoGoDaysinSeconds < 3600)){
        UIAlertView*alert = [[UIAlertView alloc]
                             initWithTitle:@"Já to no avião!"
                             message:[NSString stringWithFormat:@"%02d minutos", timetoGo.minute]
                             delegate:nil
                             cancelButtonTitle:@"Fechar"
                             otherButtonTitles:nil];
        [alert show];
        [alert release];
    }         
    
    // rule11: <0 days so = <0 seconds
    
    else if (timetoGoDaysinSeconds < 0){
        UIAlertView*alert = [[UIAlertView alloc]
                             initWithTitle:@"CHEGUEI!!"
                             message:nil
                             delegate:nil
                             cancelButtonTitle:@"Fechar"
                             otherButtonTitles:nil];
        [alert show];
        [alert release];
    }         
    
    // default rule
    
    else  { 
        UIAlertView*alert =[[UIAlertView alloc]
                            initWithTitle:@"Te amo!"
                            message:nil
                            delegate:nil 
                            cancelButtonTitle:@"Fechar"
                            otherButtonTitles:nil];
        [alert show];
        [alert release]; 
        
    }
    
    // RELEASE STRINGS
    
    [arrivalDay release];
    [dateformat release];
    [dateformatToCompare release];
    [gregorian release];
    
}

#pragma mark endofcode

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

    // getting current date and formatting
        
        NSDate *currentDate = [NSDate date];
        NSDateFormatter *dateformat = [[NSDateFormatter alloc] init];
        [dateformat setDateFormat:@"dd/MM/yyyy hh:mm:ss a"];
        
        
        NSDateFormatter *dateformatToCompare = [[NSDateFormatter alloc] init];
        [dateformatToCompare setDateFormat:@"dd/MM/yyyy"];
        
        NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
        int unitFlags = NSDayCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
        
        // defining date to compare   
        
        NSString *currentDateString = [dateformatToCompare stringFromDate:[NSDate date]];
        
        NSString *arrivalDay = [[NSString alloc] initWithString:@"12/10/2011 9:15:00 PM"];
        
        // converting string to date
        
        NSDate *arrivalDate = [dateformat dateFromString:arrivalDay];
        
        // calculating timeto    
        
        NSDateComponents *timetoGo = [gregorian components:unitFlags fromDate:currentDate toDate:arrivalDate options:0];
        
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
        
        //    label1.text=[NSString stringWithFormat:@"%02d year, ", timetoGoDaysinSeconds];
        
        // IF RULES        
        
        //rule1:
        
        if ([currentDateString isEqualToString:@"11/07/2011"]){
            UIAlertView*alert = [[UIAlertView alloc]
                                 initWithTitle:@"Parabéns, amor! 10 meses!"
                                 message:[NSString stringWithFormat:@"E agora só faltam mais %02d dias", timetoGo.day]
                                 delegate:nil
                                 cancelButtonTitle:@"Fechar"
                                 otherButtonTitles:nil];
            [alert show];
            [alert release];
        }     
        
        // rule2:
        
        else if ([currentDateString isEqualToString:@"11/08/2011"]){
            UIAlertView*alert = [[UIAlertView alloc]
                                 initWithTitle:@"11 meses amor!"
                                 message:[NSString stringWithFormat:@"Já bati o recorde? Só mais %02d dias pra eu te ver!", timetoGo.day]
                                 delegate:nil
                                 cancelButtonTitle:@"Fechar"
                                 otherButtonTitles:nil];
            [alert show];
            [alert release];
        }     
        
        // rule3:
        
        else if ([currentDateString isEqualToString:@"11/09/2011"]){
            UIAlertView*alert = [[UIAlertView alloc]
                                 initWithTitle:@"UM ANO, MEU AMOR!"
                                 message:@"Thanks por me fazer tão feliz! Daqui a um mês to aí!"
                                 delegate:nil
                                 cancelButtonTitle:@"Fechar"
                                 otherButtonTitles:nil];
            [alert show];
            [alert release];
        }         

        // rule4:
    
        else if ([currentDateString isEqualToString:@"11/10/2011"]){
            UIAlertView*alert = [[UIAlertView alloc]
                                 initWithTitle:@"Ei! Parabens :)"
                                 message:@"Mas o que importa é que amanhã to aí!!!"
                                 delegate:nil
                                 cancelButtonTitle:@"Fechar"
                                 otherButtonTitles:nil];
            [alert show];
            [alert release];
        }         

        // rule5: >75 days so > 6480000 seconds    
        
        else if (timetoGoDaysinSeconds > 6480000){
            UIAlertView*alert = [[UIAlertView alloc]
                                 initWithTitle:@"Ainda tem tempo :("
                                 message:[NSString stringWithFormat:@"%02d dias", timetoGo.day]
                                 delegate:nil
                                 cancelButtonTitle:@"Fechar"
                                 otherButtonTitles:nil];
            [alert show];
            [alert release];
        }     
    
        // rule6: >50 days and <=75 so > 4320000 and <= 6480000 seconds    
    
        else if ((timetoGoDaysinSeconds > 4320000)&&(timetoGoDaysinSeconds <= 6480000)){
            UIAlertView*alert = [[UIAlertView alloc]
                                 initWithTitle:@"Nao é que o tempo tá passando rápido?"
                                 message:[NSString stringWithFormat:@"%02d dias", timetoGo.day]
                                 delegate:nil
                                 cancelButtonTitle:@"Fechar"
                                 otherButtonTitles:nil];
            [alert show];
            [alert release];
        }     
    
        // rule7: >30 and <=50 days so > 2592000 and <= 4320000 seconds
        
        else if ((timetoGoDaysinSeconds > 2592000)&&(timetoGoDaysinSeconds <= 4320000)){
            UIAlertView*alert = [[UIAlertView alloc]
                                 initWithTitle:@"Calma que o pior já passou!!"
                                 message:[NSString stringWithFormat:@"Só mais %02d dias", timetoGo.day]
                                 delegate:nil
                                 cancelButtonTitle:@"Fechar"
                                 otherButtonTitles:nil];
            [alert show];
            [alert release];
        }         
        
        // rule7: >15 and <=30 days so > 1296000 and < 2592000 seconds
        
        else if ((timetoGoDaysinSeconds > 1296000)&&(timetoGoDaysinSeconds < 2592000)){
            UIAlertView*alert = [[UIAlertView alloc]
                                 initWithTitle:@"Menos de um mês, amor!"
                                 message:[NSString stringWithFormat:@"Só mais %02d dias", timetoGo.day]
                                 delegate:nil
                                 cancelButtonTitle:@"Fechar"
                                 otherButtonTitles:nil];
            [alert show];
            [alert release];
        }         
        
        // rule8: >7 and <=15 days so > 6048000 and < 1296000 seconds - BUGGED
        
        else if ((timetoGoDaysinSeconds > 604800)&&(timetoGoDaysinSeconds < 1296000)){
            UIAlertView*alert = [[UIAlertView alloc]
                                 initWithTitle:@"Só mais um pouquinho!"
                                 message:[NSString stringWithFormat:@"%02d dias", timetoGo.day]
                                 delegate:nil
                                 cancelButtonTitle:@"Fechar"
                                 otherButtonTitles:nil];
            [alert show];
            [alert release];
        }         
        
        // rule9: >=1 and <7 days so > 86400 and < 604800 seconds
        
        else if ((timetoGoDaysinSeconds >= 86400)&&(timetoGoDaysinSeconds < 604800)){
            UIAlertView*alert = [[UIAlertView alloc]
                                 initWithTitle:@"Já to chegando!"
                                 message:[NSString stringWithFormat:@"%02d dias e %02d horas", timetoGo.day, timetoGo.hour]
                                 delegate:nil
                                 cancelButtonTitle:@"Fechar"
                                 otherButtonTitles:nil];
            [alert show];
            [alert release];
        }         
        
        // rule10: >14hour and <=1 days so = >50400 and <= 86400 seconds
        
        else if ((timetoGoDaysinSeconds > 50400)&&(timetoGoDaysinSeconds < 86400)){
            UIAlertView*alert = [[UIAlertView alloc]
                                 initWithTitle:@"Só mais umas horinhas!"
                                 message:[NSString stringWithFormat:@"%02d horas", timetoGo.hour]
                                 delegate:nil
                                 cancelButtonTitle:@"Fechar"
                                 otherButtonTitles:nil];
            [alert show];
            [alert release];
        }         
        
        // rule11: >1hour and <=1 days so = >3600 and <= 86400 seconds
    
        else if ((timetoGoDaysinSeconds > 3600)&&(timetoGoDaysinSeconds < 86400)){
            UIAlertView*alert = [[UIAlertView alloc]
                                 initWithTitle:@"Já to no avião!"
                                 message:[NSString stringWithFormat:@"%02d horas", timetoGo.hour]
                                 delegate:nil
                                 cancelButtonTitle:@"Fechar"
                                 otherButtonTitles:nil];
            [alert show];
            [alert release];
        }         

        // rule12: >0 and <=1 hour so = >0 and <= 3600 seconds
    
        else if ((timetoGoDaysinSeconds > 0)&&(timetoGoDaysinSeconds < 3600)){
            UIAlertView*alert = [[UIAlertView alloc]
                                 initWithTitle:@"Já to no avião!"
                                 message:[NSString stringWithFormat:@"%02d minutos", timetoGo.minute]
                                 delegate:nil
                                 cancelButtonTitle:@"Fechar"
                                 otherButtonTitles:nil];
            [alert show];
            [alert release];
        }         
    
        // rule11: <0 days so = <0 seconds
        
        else if (timetoGoDaysinSeconds < 0){
            UIAlertView*alert = [[UIAlertView alloc]
                                 initWithTitle:@"CHEGUEI!!"
                                 message:nil
                                 delegate:nil
                                 cancelButtonTitle:@"Fechar"
                                 otherButtonTitles:nil];
            [alert show];
            [alert release];
        }         
        
        // default rule
        
        else  { 
            UIAlertView*alert =[[UIAlertView alloc]
                                initWithTitle:@"Te amo!"
                                message:nil
                                delegate:nil 
                                cancelButtonTitle:@"Fechar"
                                otherButtonTitles:nil];
            [alert show];
            [alert release]; 
            
        }
        
        // RELEASE STRINGS
        
        [arrivalDay release];
        [dateformat release];
        [dateformatToCompare release];
        [gregorian release];
    
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

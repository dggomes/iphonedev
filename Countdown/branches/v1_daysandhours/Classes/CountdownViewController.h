//
//  CountdownViewController.h
//  Countdown
//
//  Created by Daniel Gomes on 30/04/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CountdownViewController : UIViewController {

	IBOutlet UIButton *startCountdown;
	IBOutlet UIImageView *bg;
	IBOutlet UILabel *today;
	IBOutlet UILabel *todayLabel;
//	IBOutlet UITextField *todayLabel2;
//	IBOutlet NSString *string1;
//	IBOutlet NSString *string2;
}

@property (retain, nonatomic) IBOutlet UIButton *startCountdown;
@property (retain, nonatomic) IBOutlet UIImageView *bg;
@property (retain, nonatomic) IBOutlet UILabel *today;
//@property (retain, nonatomic) IBOutlet UILabel *todayLabel;
//@property (retain, nonatomic) IBOutlet UITextField *todayLabel2;
//@property (retain, nonatomic) IBOutlet NSString *string1;
//@property (retain, nonatomic) IBOutlet NSString *string2;

-(IBAction)doAlert:(id)sender;

@end

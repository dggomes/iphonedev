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
	IBOutlet UILabel *label1;
//	IBOutlet UILabel *label2;
//	IBOutlet UILabel *label3;
//  IBOutlet UILabel *label4;
//  IBOutlet UILabel *label5;
//  IBOutlet UILabel *label6;
//  IBOutlet UILabel *label7;
//  IBOutlet UILabel *label8;
    IBOutlet UILabel *label9;
//  IBOutlet UILabel *label10;
    
}

@property (retain, nonatomic) IBOutlet UIButton *startCountdown;
@property (retain, nonatomic) IBOutlet UIImageView *bg;
@property (retain, nonatomic) IBOutlet UILabel *label1;
// @property (retain, nonatomic) IBOutlet UILabel *label2;
// @property (retain, nonatomic) IBOutlet UILabel *label3;
// @property (retain, nonatomic) IBOutlet UILabel *label4;
// @property (retain, nonatomic) IBOutlet UILabel *label5;
// @property (retain, nonatomic) IBOutlet UILabel *label6;
// @property (retain, nonatomic) IBOutlet UILabel *label7;
// @property (retain, nonatomic) IBOutlet UILabel *label8;
   @property (retain, nonatomic) IBOutlet UILabel *label9;
// @property (retain, nonatomic) IBOutlet UILabel *label10;

-(IBAction)doAlert:(id)sender;

@end

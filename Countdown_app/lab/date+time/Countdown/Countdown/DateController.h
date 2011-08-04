//
//  FirstViewController.h
//  Countdown
//
//  Created by Daniel Gomes on 03/08/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h> 


@interface FirstViewController : UIViewController <UITextFieldDelegate>{
    IBOutlet UILabel *currentDateLabel;
    IBOutlet UITextField *userInputDate;
    IBOutlet UITextField *userInputTime;
    IBOutlet UIDatePicker *datePicker;
    IBOutlet UIDatePicker *timePicker;
    
}

@property (retain, nonatomic) IBOutlet UILabel *currentDateLabel;
@property (retain, nonatomic) IBOutlet UITextField *userInputDate;
@property (retain, nonatomic) IBOutlet UITextField *userInputTime;
@property (retain, nonatomic) IBOutlet UIDatePicker *datePicker;
@property (retain, nonatomic) IBOutlet UIDatePicker *timePicker;

- (IBAction) showDate:(id)sender;
- (IBAction) dismissKeyboard:(id)sender;
- (IBAction) dateChanged:(id)sender;

@end

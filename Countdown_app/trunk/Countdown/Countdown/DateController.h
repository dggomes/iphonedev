//
//  DateController.h
//  Countdown
//
//  Created by Daniel Gomes on 03/08/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h> 


@interface DateController : UIViewController <UITextFieldDelegate>{
    IBOutlet UITextField *userInputDate;
    IBOutlet UIDatePicker *datePicker;
    
}

@property (retain, nonatomic) IBOutlet UITextField *userInputDate;
@property (retain, nonatomic) IBOutlet UIDatePicker *datePicker;

- (IBAction) doCountdown:(id)sender;
- (IBAction) dismissKeyboard:(id)sender;
- (IBAction) dateChanged:(id)sender;

@end

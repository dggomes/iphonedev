//
//  TimeController.h
//  Countdown
//
//  Created by Daniel Gomes on 04/08/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface TimeController : UIViewController <UITextFieldDelegate>{

    IBOutlet UITextField *userInputTime;
    IBOutlet UIDatePicker *timePicker;
    
}

@property (retain, nonatomic) IBOutlet UITextField *userInputTime;
@property (retain, nonatomic) IBOutlet UIDatePicker *timePicker;

- (IBAction) dismissKeyboard:(id)sender;
- (IBAction) dateChanged:(id)sender;
- (IBAction) dateChanged:(id)sender;

@end

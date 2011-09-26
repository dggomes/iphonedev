//
//  CameraTestViewController.h
//  CameraTest
//
//  Created by Daniel Gomes on 26/08/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CameraTestViewController : UIViewController <UINavigationControllerDelegate, UIImagePickerControllerDelegate> {
    
    IBOutlet UIButton *button;
    
}

@property (retain, nonatomic) UIButton *button;

@end

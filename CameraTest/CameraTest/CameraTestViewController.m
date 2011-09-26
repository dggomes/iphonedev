//
//  CameraTestViewController.m
//  CameraTest
//
//  Created by Daniel Gomes on 26/08/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CameraTestViewController.h"

@implementation CameraTestViewController
@synthesize button;

- (void)buttonPressed:(UIButton *)button
{
 	// Create image picker controller
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    
    // Set source to the camera
	imagePicker.sourceType =  UIImagePickerControllerSourceTypeCamera;
    
    // Delegate is self
	imagePicker.delegate = self;
    
    // Allow editing of image ?
	imagePicker.allowsImageEditing = NO;
    
    // Show image picker
	[self presentModalViewController:imagePicker animated:YES];	
    
}

- (void)dealloc
{
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
}
*/

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end

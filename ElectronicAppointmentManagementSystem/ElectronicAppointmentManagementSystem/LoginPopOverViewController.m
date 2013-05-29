//
//  PopOverViewController.m
//  ElectronicAppointmentManagementSystem
//
//  Created by TechCorp on 5/8/13.
//  Copyright (c) 2013 TechCorp. All rights reserved.
//

#import "LoginPopOverViewController.h"
#import "ReceptionistDoctorVerifiedViewController.h"
#import "BIDViewController.h"

@interface LoginPopOverViewController ()

@end

@implementation LoginPopOverViewController
@synthesize myDelegate;
@synthesize IdNoUiLabel;
@synthesize PasswordUiLabel;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}

- (IBAction)LoginButton:(id)sender
{
    
    if([IdNoUiLabel.text isEqualToString:@""]  && [PasswordUiLabel.text isEqualToString: @""])
    {
        [myDelegate AuthenticateUser];
    }
//    else
//    {
//        
//        alert = [[UIAlertView alloc]initWithTitle:@"Sorry" message:@"UnAuthorized User Are not alowed further than this" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
//        [alert show];
//        
//    }
//    
}
@end

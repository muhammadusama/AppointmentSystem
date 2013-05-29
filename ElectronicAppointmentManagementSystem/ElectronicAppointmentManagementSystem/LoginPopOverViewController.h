//
//  PopOverViewController.h
//  ElectronicAppointmentManagementSystem
//
//  Created by TechCorp on 5/8/13.
//  Copyright (c) 2013 TechCorp. All rights reserved.
//


@protocol UserAuthenticationDelegate <NSObject>

-(void)AuthenticateUser;

@end
#import <UIKit/UIKit.h>

@class ReceptionistDoctorVerifiedViewController;

@interface LoginPopOverViewController : UIViewController
{
    id<UserAuthenticationDelegate>myDelegate;
    UIAlertView *alert;
}
///////////////action methods////////////
- (IBAction)LoginButton:(id)sender;

///////////////Outlets///////////////////
@property (nonatomic, retain) id<UserAuthenticationDelegate>myDelegate;
@property (weak, nonatomic) IBOutlet UITextField *IdNoUiLabel;
@property (weak, nonatomic) IBOutlet UITextField *PasswordUiLabel;


@end

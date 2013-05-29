//
//  BIDViewController.h
//  ElectronicAppointmentManagementSystem
//
//  Created by TechCorp on 5/8/13.
//  Copyright (c) 2013 TechCorp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LoginPopOverViewController.h"
#import "PatientViewDocProfileViewController.h"
@class PatientViewDocProfileViewController;
@class DoctorInfoItem;
@class LoginPopOverViewController;
@class ReceptionistDoctorVerifiedViewController;



/////////////////////////////////////////////////////////////////////////////////////////////
@interface BIDViewController : UIViewController<UIPopoverControllerDelegate, UserAuthenticationDelegate>
{
    UIPopoverController* popover;
    NSString *Id;
    NSString *Password;
    NSMutableArray *arrayDoctorInfo;
    LoginPopOverViewController *loginPopOverViewController;
    ReceptionistDoctorVerifiedViewController* receptionist;
    PatientViewDocProfileViewController *objDocProfile;
}

////////////Action Methods//////////////
- (IBAction)SignInBttn:(id)sender;

////////////Outlet/////////////////////
@property (retain, nonatomic) NSMutableArray *arrayDoctorInfo;
@property (weak, nonatomic) IBOutlet UITableView *doctorsTableView;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *signInButton;
@end


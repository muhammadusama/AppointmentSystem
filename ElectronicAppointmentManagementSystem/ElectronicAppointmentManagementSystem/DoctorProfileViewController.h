//
//  DoctorProfileViewController.h
//  ElectronicAppointmentManagementSystem
//
//  Created by TechCorp on 5/15/13.
//  Copyright (c) 2013 TechCorp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DocProfilePopUpViewController.h"
@class ReceptionistDoctorVerifiedViewController;


@interface DoctorProfileViewController : UIViewController<UIPopoverControllerDelegate, ShowProfileDelegate>
{
    UIPopoverController *docPopOver;
    DocProfilePopUpViewController *objDocPopOver;
}
//////////////////////////////////////////////////////////////////////

/*
Outlets 
 */

//@property (weak, nonatomic) IBOutlet UISearchBar *searchBarDoctorProfile;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *selectDocPopUp;
@property (weak, nonatomic) IBOutlet UITextField *lastNameDoctor;

@property (weak, nonatomic) IBOutlet UITextField *firstNameDoctor;
@property (weak, nonatomic) IBOutlet UITextField *qualificationDoctor;
@property (weak, nonatomic) IBOutlet UITextField *specializationDoctor;

//////////////////////////////////////////////////////////////////////


/*
IBaction
*/

- (IBAction)GetAppointmentTappd:(id)sender;

- (IBAction)BackButtonTappd:(id)sender;
- (IBAction)SelectDocPopUp:(id)sender;

//////////////////////////////////////////////////////////////////////

@end

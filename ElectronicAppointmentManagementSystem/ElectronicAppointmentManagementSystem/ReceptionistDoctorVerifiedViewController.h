//
//  ReceptionistDoctorVerifiedViewController.h
//  ElectronicAppointmentManagementSystem
//
//  Created by TechCorp on 5/15/13.
//  Copyright (c) 2013 TechCorp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CalendarViewController.h"
@class NewPatientEntryViewController;
@class DoctorProfileViewController;
@class EstablishedPatientViewController;

@interface ReceptionistDoctorVerifiedViewController : UIViewController
{
  NewPatientEntryViewController *objectNewPatient;
    DoctorProfileViewController *objectDoctorProfile;
    EstablishedPatientViewController *objectEstablishedPatientView;
  
}
//////////////////////Action Methods///////////////////
- (IBAction)EstablishedPatientButton:(id)sender;
- (IBAction)NewPatientTapped:(id)sender;
- (IBAction)DoctorProfileOpenButtn:(id)sender;

///////////////////////Outlet////////////////////////////
//@property (nonatomic, retain) NewPatientEntryViewController *objectNewPatient; //object property
- (IBAction)LogoutBtnTpd:(id)sender;
- (IBAction)ShowCurrentAppointments:(id)sender;

@end

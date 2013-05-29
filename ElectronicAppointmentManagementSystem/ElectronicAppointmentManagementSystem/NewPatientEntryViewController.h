//
//  NewPatientEntryViewController.h
//  ElectronicAppointmentManagementSystem
//
//  Created by TechCorp on 5/14/13.
//  Copyright (c) 2013 TechCorp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PatientInfoItem.h"

@class ReceptionistAndDoctorFirstVerificationViewController;

@interface NewPatientEntryViewController : UIViewController
{
    UIAlertView *alert1;
    PatientInfoItem *patientInfoItem;
}

////////////////////Action Methods///////////////////
- (IBAction)BackButtonPatient:(id)sender;
- (IBAction)SaveButtonNewPatient:(id)sender;

////////////////////Outlets/////////////////////////
@property (weak, nonatomic) IBOutlet UIImageView *imageNewPatient;
@property (weak, nonatomic) IBOutlet UITextField *nameNewPatientLabel;
@property (weak, nonatomic) IBOutlet UITextField *numberNewPatientLabel;
@property (weak, nonatomic) IBOutlet UITextField *eMailNewPatientLabel;
@property (weak, nonatomic) IBOutlet UITextView *descriptionNewPatientTextView;
@property (weak, nonatomic) IBOutlet UITextField *firstNameNewPatientLabel;

@end

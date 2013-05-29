//
//  PatientViewDocProfileViewController.h
//  ElectronicAppointmentManagementSystem
//
//  Created by TechCorp on 5/22/13.
//  Copyright (c) 2013 TechCorp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DoctorInfoItem.h"

@interface PatientViewDocProfileViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *firstNamelabel;
@property (weak, nonatomic) IBOutlet UITextField *lastNamelabel;
@property (weak, nonatomic) IBOutlet UITextField *qualificationlabel;
@property (weak, nonatomic) IBOutlet UITextField *specializatonlabel;

///////////////////////////////
-(void)SetDoctorDetail:(DoctorInfoItem*)docItem;
- (IBAction)GoBackButton:(id)sender;

@end

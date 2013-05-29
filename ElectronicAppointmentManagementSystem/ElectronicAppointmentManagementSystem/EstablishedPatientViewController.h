//
//  EstablishedPatintViewController.h
//  ElectronicAppointmentManagementSystem
//
//  Created by TechCorp on 5/15/13.
//  Copyright (c) 2013 TechCorp. All rights reserved.
//

#import <UIKit/UIKit.h>
@class PopUpEstablishedPatientViewController;
@interface EstablishedPatientViewController : UIViewController<UIPopoverControllerDelegate>
{
    PopUpEstablishedPatientViewController *objPopUpEstablishedPatient;
    UIPopoverController *popOverPatientList;

}
//////////////////////////Action Methods/////////////////
- (IBAction)SearchPatientBarButton:(id)sender;
- (IBAction)BackBarBttn:(id)sender;
/////////////////////////Properties///////////////////////

@property (weak, nonatomic) IBOutlet UIBarButtonItem *searchPatientBarButton;

@end

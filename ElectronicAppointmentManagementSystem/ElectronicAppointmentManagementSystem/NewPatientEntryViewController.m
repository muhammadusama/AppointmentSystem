//
//  NewPatientEntryViewController.m
//  ElectronicAppointmentManagementSystem
//
//  Created by TechCorp on 5/14/13.
//  Copyright (c) 2013 TechCorp. All rights reserved.
//

#import "NewPatientEntryViewController.h"

@interface NewPatientEntryViewController ()

@end

@implementation NewPatientEntryViewController

@synthesize imageNewPatient;
@synthesize nameNewPatientLabel;
@synthesize numberNewPatientLabel;
@synthesize eMailNewPatientLabel;
@synthesize descriptionNewPatientTextView;
@synthesize firstNameNewPatientLabel;

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
    // Do any additional setup after loading the view from its nib.
    patientInfoItem = [[PatientInfoItem alloc] init];
    
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

- (IBAction)BackButtonPatient:(id)sender
{
    [self.view removeFromSuperview];
}

- (IBAction)SaveButtonNewPatient:(id)sender
{
    
  
    
    alert1 = [[UIAlertView alloc] initWithTitle:@"Data Saved" message:@"The Data of Patient Is saved" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil]; 
        
    patientInfoItem.firstName = nameNewPatientLabel.text;
    patientInfoItem.phoneNumber= numberNewPatientLabel.text;
    patientInfoItem.emaiAddress= eMailNewPatientLabel.text;
    
    descriptionNewPatientTextView.text = @"";
    
    [alert1 show];

    
}
@end

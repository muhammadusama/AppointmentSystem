//
//  ReceptionistDoctorVerifiedViewController.m
//  ElectronicAppointmentManagementSystem
//
//  Created by TechCorp on 5/15/13.
//  Copyright (c) 2013 TechCorp. All rights reserved.
//

#import "ReceptionistDoctorVerifiedViewController.h"
#import "NewPatientEntryViewController.h"
#import "DoctorProfileViewController.h"
#import "EstablishedPatientViewController.h"
@interface ReceptionistDoctorVerifiedViewController ()

@end

@implementation ReceptionistDoctorVerifiedViewController
//@synthesize objectNewPatient;
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
- (IBAction)EstablishedPatientButton:(id)sender
{
    objectEstablishedPatientView =[[EstablishedPatientViewController alloc] initWithNibName:@"EstablishedPatientViewController" bundle:nil];
    [self.view addSubview:objectEstablishedPatientView.view];
}

- (IBAction)NewPatientTapped:(id)sender
{
    objectNewPatient = [[NewPatientEntryViewController alloc] initWithNibName:@"NewPatientEntryViewController" bundle:nil];
    [self.view addSubview:objectNewPatient.view];
}

- (IBAction)DoctorProfileOpenButtn:(id)sender
{
    objectDoctorProfile = [[DoctorProfileViewController alloc] initWithNibName:@"DoctorProfileViewController" bundle:nil];
    [self.view addSubview:objectDoctorProfile.view];
}
- (IBAction)LogoutBtnTpd:(id)sender
{
    [self.view removeFromSuperview];
}

- (IBAction)ShowCurrentAppointments:(id)sender
{
    CalendarViewController* calenderViewController = [[CalendarViewController alloc] initWithNibName:@"CalendarViewController" bundle:nil];
    [self.view addSubview:calenderViewController.view];
}
@end

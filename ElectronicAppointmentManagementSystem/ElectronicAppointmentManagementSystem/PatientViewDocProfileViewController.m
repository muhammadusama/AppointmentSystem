//
//  PatientViewDocProfileViewController.m
//  ElectronicAppointmentManagementSystem
//
//  Created by TechCorp on 5/22/13.
//  Copyright (c) 2013 TechCorp. All rights reserved.
//

#import "PatientViewDocProfileViewController.h"
#import "DoctorInfoItem.h"

@interface PatientViewDocProfileViewController ()

@end

@implementation PatientViewDocProfileViewController
@synthesize firstNamelabel;
@synthesize lastNamelabel;
@synthesize qualificationlabel;
@synthesize specializatonlabel;

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
-(void)SetDoctorDetail:(DoctorInfoItem*)docItem
{
    self.firstNamelabel.text = docItem.name;
    self.qualificationlabel.text = docItem.qualification;
    self.specializatonlabel.text = docItem.specialization;

}

- (IBAction)GoBackButton:(id)sender
{
    [self.view removeFromSuperview];
}

@end

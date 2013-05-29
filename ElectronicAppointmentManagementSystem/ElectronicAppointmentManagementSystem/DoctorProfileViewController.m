//
//  DoctorProfileViewController.m
//  ElectronicAppointmentManagementSystem
//
//  Created by TechCorp on 5/15/13.
//  Copyright (c) 2013 TechCorp. All rights reserved.
//

#import "DoctorProfileViewController.h"
#import "DoctorInfoItem.h"

@interface DoctorProfileViewController ()

@end

@implementation DoctorProfileViewController
//@synthesize searchBarDoctorProfile;
@synthesize selectDocPopUp;
@synthesize lastNameDoctor;
@synthesize firstNameDoctor;
@synthesize qualificationDoctor;
@synthesize specializationDoctor;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        // Custom initialization
    }
    return self;
    }

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    objDocPopOver = [[DocProfilePopUpViewController alloc] initWithNibName:@"DocProfilePopUpViewController" bundle:Nil];
    objDocPopOver.myDelegate = self;

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

- (IBAction)GetAppointmentTappd:(id)sender {
}

- (IBAction)BackButtonTappd:(id)sender
{
    [self.view removeFromSuperview];
    
    if ([docPopOver isPopoverVisible])
    {
        [docPopOver dismissPopoverAnimated:YES];
    }
}

- (IBAction)SelectDocPopUp:(id)sender
{
    if(![docPopOver isPopoverVisible])
    {
        docPopOver = [[UIPopoverController alloc] initWithContentViewController:objDocPopOver];
        [docPopOver setPopoverContentSize:CGSizeMake(250, 600) animated:YES];
        [docPopOver presentPopoverFromBarButtonItem:self.selectDocPopUp permittedArrowDirections:UIPopoverArrowDirectionUp animated:YES];
    }
    
}
/////////////////////delegate Method//////defined in class DocProfilePopUpViewController/////////////////////
-(void) ShowProfile:(DoctorInfoItem *)doctorInfoItem
{
    self.firstNameDoctor.text = doctorInfoItem.name;
    self.qualificationDoctor.text = doctorInfoItem.qualification;
    self.specializationDoctor.text = doctorInfoItem.specialization;
}
@end

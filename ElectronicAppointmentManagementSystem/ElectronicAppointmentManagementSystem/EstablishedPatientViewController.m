//
//  EstablishedPatintViewController.m
//  ElectronicAppointmentManagementSystem
//
//  Created by TechCorp on 5/15/13.
//  Copyright (c) 2013 TechCorp. All rights reserved.
//

#import "EstablishedPatientViewController.h"
#import "PopUpEstablishedPatientViewController.h"

@interface EstablishedPatientViewController ()

@end

@implementation EstablishedPatientViewController
@synthesize searchPatientBarButton;

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
    objPopUpEstablishedPatient =[[PopUpEstablishedPatientViewController alloc]initWithNibName:@"PopUpEstablishedPatientViewController" bundle:nil];
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

- (IBAction)SearchPatientBarButton:(id)sender
{
    if (![popOverPatientList isPopoverVisible]) {
        
    
    popOverPatientList = [[UIPopoverController alloc] initWithContentViewController:objPopUpEstablishedPatient];
    [popOverPatientList setPopoverContentSize:CGSizeMake(300,500) animated:YES];
    [popOverPatientList presentPopoverFromBarButtonItem:searchPatientBarButton permittedArrowDirections:UIPopoverArrowDirectionUp animated:YES];
                                                    }
}
- (IBAction)BackBarBttn:(id)sender
{
    [self.view removeFromSuperview];
    if ([popOverPatientList isPopoverVisible])
    {
            [popOverPatientList dismissPopoverAnimated:YES];
    }
}
@end
